class Api::V1::ProductsController < ApplicationController
  include Rails.application.routes.url_helpers
  before_action :authenticate_api_user!
  before_action :only_correct_user, only: [:edit, :update, :destroy]

  def index
    # render json: {success:true, products: Product.all}
      render json: Product.all.sort
  rescue => e
    render json: {success:false, error: e}, :status => 500
  end

  def new
  end

  def create
    product = Product.new(products_params)
    product_type = ProductType.find(params[:p_type])
    product_category = ProductCategory.find(params[:category])
    product_sub_category = ProductSubCategory.where("id = ? and product_category_id = ?",  params[:sub_category], product_category.id)[0]
    product.user_id = current_api_user.id
    product.product_type_id = product_type.id
    product.product_sub_category_id = product_sub_category.id
    if product.save
      # current_api_user.products << product
      render json: product
      return
    end
    render json: {success:false, errors:Product.create.errors}, :status => 400
  rescue => e
    render json: {success:false, error: e}, :status => 500
  end

  def edit
    render json: Product.find(params[:id])
  end

  def update
    title, detail, price, images, quantity = params[:title], params[:detail], params[:price], params[:images], params[:quantity]
    product = Product.find(params[:id])
    if !product
      render json: {success:false, message:"Not Found"}, :status => 400
      return
    end
    if title
      product.title = title
    end
    if detail
      product.detail = detail
    end
    if price
      product.price = price
    end
    if quantity
      product.quantity = quantity
    end
    # if images
    #   images.each do |image|
    #     product.images << image
    #   end
    # end
    product_type = ProductType.find(params[:p_type])
    product_category = ProductCategory.find(params[:category])
    product_sub_category = ProductSubCategory.where("id = ? and product_category_id = ?",  params[:sub_category], product_category.id)[0]
    if images
      product.update({title: product.title, detail:product.detail, price: product.price, quantity: product.quantity, images: images, product_type_id: product_type.id, product_sub_category_id: product_sub_category.id})
    else
      product.update({title: product.title, detail:product.detail, price: product.price, quantity: product.quantity, product_type_id: product_type.id, product_sub_category_id: product_sub_category.id})
    end
    # product.update(products_params)
    # if params[:images].present?
    #   params[:images].each do |image|
    #     product.images.attach(image)
    #   end
    # end
    render json: product
  rescue => e
    render json: {success:false, error: e}, :status => 500
  end

  def add_images
    id, images = params[:id], params[:images]
    product = Product.find(params[:id])
    if !product
      render json: {success:false, errors:"Product Not Found"}, :status => 400
      return
    end
    product.update({images: images})
    render json: product
  rescue => e
    render json: {success: false, errors: e}, :status => 500
  end

  def remove_image
    product_id, image_index = params[:id], params[:index].to_i
    product = Product.find(product_id)
    if !product
      render json: {success:false, errors:"Product Not Found"}, :status => 400
      return
    end
    if image_index >= product.images.length
      render json: {success:false, errors:"Image Not Found"}, :status => 400
      return
    end
    image = product.images[image_index]
    image.purge
    render json: Product.find(product_id)
  rescue => e
    render json: {success: false, errors: e}, :status => 500
  end

  def destroy
    product = Product.find(params[:id])
    if !product
      render json: {success:false, message:"Not Found"}, :status => 400
      return
    end
    # current_api_user.products.delete(product)
    product.destroy
    render json: product
  rescue
    render json: {success:false, error: "Internal Server error occured !"}, :status => 500
  end

  def user_specific_products
    products = current_api_user.products.sort
    render json: products
  rescue => e
    render json: {success:false, error: e}, :status => 500
  end

  private
  def products_params
    params.permit(:title, :detail, :price, :quantity, images: [])
  end

  def only_correct_user
    product = Product.find(params[:id])
    if current_api_user.id != product.user_id
      render json: {success:false, error: "You are not allowed to perform this action"}, :status => 500
    end
  end
end
