class ProductsController < ApplicationController


# this will have the same name as the html file

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end



end
