class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_api_user!
  before_action :user_cant_comment_own_product, only: [:new, :create]

  def index
    product = Product.find(params[:product_id])
    render json: product.comments
  rescue
    render json: {Error: "Internal Server error occured !"}, :status => 500
  end

  def new
  end

  def create
    product = Product.find(params[:product_id])
    # comment = product.comments.create(comments_params)
    comment = Comment.new({commenter:params[:commenter], body:params[:body], product_id:params[:product_id]})
    if comment.save
      product.comments << comment
      render json: comment
      return
    else
      render json: comment.errors
      return
    end
    render json: comment
  rescue
    render json: {Error: "Internal Server error occured !"}, :status => 500
  end

  def edit
    comment = comment.find(params[:id])
    render json: comment
  end

  def update
    commenter, body = params[:commenter], params[:body]
    product = Product.find(params[:product_id])
    comment = Comment.find(params[:id])
    if !product || !comment
      render json: {Output:"Comment Not Found"}, :status => 400
      return
    end
    if commenter
      comment.commenter = commenter
    end
    if body
      comment.body = body
    end
    comment.update({commenter: comment.commenter, body:comment.body})
    render json: comment
  rescue
    render json: {Error: "Internal Server error occured !"}, :status => 500
  end

  def destroy
    product = Product.find(params[:product_id])
    comment = Comment.find(params[:id])
    if !product || !comment
      render json: {Output:"Not Found"}, :status => 400
      return
    end
    product.comments.delete(comment)
    comment.destroy
    render json: {Success:"Comment has been deleted", comment: comment}
  rescue
    render json: {Error: "Internal Server error occured !"}, :status => 500
  end

  private
  def comments_params
    params.permit(:commenter, :body)
  end

  def user_cant_comment_own_product
    product = Product.find(params[:product_id])
    if current_api_user.id == product.user_id
      render json: {"Error": "You are not allowed to comment on your product"}
    end
  end
end
