class ReviewsController < ApplicationController

  before_filter :redirect_to_login, :unless => :is_user_loggedin

  def new
  end

  def destroy
    @review = Review.find params[:id]
    @product = @review.product
    @review.destroy
    redirect_to @product
  end

  def create
    @product = Product.find params[:product_id]
    @review = @product.reviews.new(review_params)
    @review.user = current_user
      if @review.save
        redirect_to @product
      else
        redirect_to @product
      end
  end


  private

  def redirect_to_login
    redirect_to '/login', notice: 'You have to be logged in to leave a review.'
  end

  def review_params
    params.require(:review).permit(:product_id, :user_id, :description, :rating)
    # params.permit(:product_id, :user_id, :description, :rating)
  end

  def is_user_loggedin
    not current_user.nil?
  end

end