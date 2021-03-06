class DosesController < ApplicationController

  def create
    @dose = Dose.new(doses_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktail_path(params[:cocktail_id])
  end

  private

  def doses_params
    params.require(:dose).permit(:name, :ingredient_id, :description)
  end
end
