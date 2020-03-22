class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = find_cocktail
    @dose = Dose.new(dose_params)
    @ingredient = Ingredient.find(@dose.ingredient_id)
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def edit

  end

  def update

  end

  def delete
    @dose = find_dose
    @cocktail = find_cocktail
    if @dose.destroy
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
