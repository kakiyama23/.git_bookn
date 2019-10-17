class ProductsController < ApplicationController
before_action :authenticate_user!, except: :index
  
def index
 @products = Product.all
 product_ids = Comment.group(:product_id).order('count_product_id DESC').limit(5).count(:product_id).keys
 @ranking = product_ids.map { |id| Product.find(id) }
end

def show
  @product = Product.find(params[:id])
  @comments = @product.comments
end

end