class DosesController < ApplicationController
  def index
    @doses = dose.all
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @ingredient = Ingredient.find(@dose.ingredient_id)
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def delete
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
