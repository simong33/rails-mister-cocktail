class ReviewsController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.cocktail = Restaurant.find(params[:cocktail])
    @review.save

    redirect_to cocktail_path(params[:cocktail_id])
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
