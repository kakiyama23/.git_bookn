class CommentsController < ApplicationController

 def new
  @product = Product.find(params[:product_id])
  @comment = Comment.new
 end
 
 def create
  @product = Product.find(params[:product_id])
  Comment.create(rate: create_params[:rate], review: create_params[:review], product_id: create_params[:product_id], user_id: current_user.id)
  redirect_to controller: :products, action: :index
 end

 def show
 end
  
 private
 def create_params
  params.permit(:rate, :review, :product_id, :user_id)
 end
  
end
