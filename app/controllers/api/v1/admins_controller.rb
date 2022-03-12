class Api::V1::AdminsController < ApplicationController
  before_action :authenticate_api_user!
  before_action :allow_admins_only

  def get_all_user_accounts
    users = User.all
    render json: User.all
  rescue => e
    render json: {success:false, error: e}, :status => 500
  end

  def remove_user
    user = User.find(params[:id])
    user.destroy
    render json: user
  rescue => e
    render json: {success:false, error: e}, :status => 500
    # render json: {Error: "Internal Server error occured !"}, :status => 500
  end

  def update_user
    user = User.find(params[:id])
    if !user
      render json: {success:false, message:"User not Found"}, :status => 400
      return
    end
    usr = User.new(user_params)
    user.update({name: usr.name, email:usr.email, category:usr.category, status:usr.status, phone: usr.phone, gender:usr.gender, dob:usr.dob, password:usr.password, password_confirmation:usr.password_confirmation})
    # render json: {success:true, msg:"User has been updated successfully !"}
    render json: usr
  rescue => e
    render json: {success:false, error: e}, :status => 500
  end

  def get_all_products
    render json: Product.all
  rescue
    render json: {success:false, error: "Internal Server error occured !"}, :status => 500
  end

  def remove_product
    product = Product.find(params[:id])
    product.destroy
    render json: product
  rescue => e
    render json: {success:false, error: e}, :status => 500
    # render json: {Error: "Internal Server error occured !"}, :status => 500
  end

  def update_product
    prod = Product.find(params[:id])
    if !prod
      render json: {success: false, message:"product not Found"}, :status => 400
      return
    end
    product = Product.new(product_params)
    product_type = ProductType.find(params[:p_type])
    product_category = ProductCategory.find(params[:category])
    product_sub_category = ProductSubCategory.where("id = ? and product_category_id = ?",  params[:sub_category], product_category.id)[0]
    product.update({title: product.title, detail:product.detail, price: product.price, quantity: product.quantity, images: product.images, product_type_id: product_type.id, product_sub_category_id: product_sub_category.id})
    render json: product
  rescue => e
    render json: {success: false, error: e}, :status => 500
  end

  private
  def user_params
    params.permit(:name, :email, :category, :status, :password, :password_confirmation, :phone, :gender, :dob)
  end

  def product_params
    params.permit(:title, :detail, :price, :quantity)
  end

  def allow_admins_only
    if current_api_user.email != 'konnect2hammad@gmail.com'
      render json: {success:false, error: "Sorry, only Admins are allowed to perform this actions !"}
    end
  end
end
