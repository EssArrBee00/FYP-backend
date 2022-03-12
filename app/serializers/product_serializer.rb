class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :detail, :price, :quantity, :product_type_id, :product_category_id, :product_sub_category_id, :user_id, :images

  def images
    i = 1
    images = object.images.map do |image|
      url_for(image) if object.images.attached?
      # i
    end
  end

  def user_id
    User.find(object.user_id).email
  end

  def product_type_id
    ProductType.find(object.product_type_id).name
  end

  def product_category_id
    sub_category = ProductSubCategory.find(object.product_sub_category_id)
    ProductCategory.find(sub_category.product_category_id).name
  end

  def product_sub_category_id
    ProductSubCategory.find(object.product_sub_category_id).name
  end
end
