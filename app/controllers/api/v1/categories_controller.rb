class Api::V1::CategoriesController < ApplicationController
  include Rails.application.routes.url_helpers
  before_action :authenticate_api_user!

  def all_categories
    render json: {types: ProductType.all, categories: ProductCategory.all , sub_categories: ProductSubCategory.all}
  end

  def user_specific_categories
    render json: {types: ProductType.all, categories: current_api_user.product_categories , sub_categories: current_api_user.product_sub_categories}
  end

  def create_category
    category = ProductCategory.new
    category.name = params[:name].downcase
    if ProductType.find(params[:product_type_id])
      category.product_type_id = params[:product_type_id]
      category.user_id = current_api_user.id
    end
    if category.save
      render json: category
      return
    end
    render json: {success:false, errors:ProductCategory.create.errors}, :status => 400
  rescue => e
    render json: {success:false, errors: e}, :status => 500
  end

  def update_category
    category = ProductCategory.find(params[:id])
    unless current_api_user.product_categories.include?(category)
      render json: {errors: "You are not allowed to update this category !"}
      return
    end
    if ProductType.find(params[:product_type_id]) && category.update({name: params[:name], product_type_id: params[:product_type_id], user_id: current_api_user.id})
      render json: category
      return
    end
    render json: {success:false, errors:ProductCategory.update.errors}, :status => 400
  rescue => e
    render json: {success:false, errors: e}, :status => 500
  end

  def destroy_category
    category = ProductCategory.find(params[:id])
    if !category
      render json: {success:false, message:"Category not found"}, :status => 400
      return
    end
    category.destroy
    render json: category
  rescue
    render json: {success:false, error: "Internal Server error occured !"}, :status => 500
  end

  def create_sub_category
    sub_category = ProductSubCategory.new
    sub_category.name = params[:name].downcase
    if ProductCategory.find(params[:product_category_id])
      sub_category.product_category_id = params[:product_category_id]
      sub_category.user_id = current_api_user.id
    end
    if sub_category.save
      render json: sub_category
      return
    end
    render json: {success:false, errors:ProductSubCategory.create.errors}, :status => 400
  rescue => e
    render json: {success:false, errors: e}, :status => 500
  end

  def update_sub_category
    sub_category = ProductSubCategory.find(params[:id])
    unless current_api_user.product_sub_categories.include?(sub_category)
      render json: {errors: "You are not allowed to update this sub-category !"}
      return
    end
    if ProductCategory.find(params[:product_category_id]) && sub_category.update({name: params[:name], product_category_id: params[:product_category_id], user_id: current_api_user.id})
      render json: sub_category
      return
    end
    render json: {success:false, errors:ProductSubCategory.update.errors}, :status => 400
  rescue => e
    render json: {success:false, errors: e}, :status => 500
  end

  def destroy_sub_category
    sub_category = ProductSubCategory.find(params[:id])
    if !sub_category
      render json: {success:false, message:"Sub-Category not found"}, :status => 400
      return
    end
    unless current_api_user.product_sub_categories.include?(sub_category)
      render json: {errors: "You are not allowed to destroy this product !"}
      return
    end
    sub_category.destroy
    render json: sub_category
  rescue
    render json: {success:false, error: "Internal Server error occured !"}, :status => 500
  end

end
