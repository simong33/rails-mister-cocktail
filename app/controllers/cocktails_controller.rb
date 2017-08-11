class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def top
    Cocktail.all.each do |cocktail|
      cocktail[:mean_rating] = cocktail.mean_rating
      cocktail.save
    end
    @top_cocktails = Cocktail.order(:mean_rating).last(10)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
