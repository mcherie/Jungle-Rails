class ProductsController < ApplicationController


# this will have the same name as the html file

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @new_review = Review.new(:product=>@product)
  end

  def get_user user_id
    User.find_by(id: user_id)
  end


  helper_method :get_user

  def destroy
    @review = Review.find params[:id]
    @product_id = @review.product_id
    @review.destroy

    redirect_to @products
  end

end
