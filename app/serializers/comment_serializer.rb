class CommentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :commenter, :body, :product_name

  def product_name
    Product.find(object.product_id).title
  end
end
