class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = []
    @cocktail.doses.each do |dose|
      @doses << dose
    end
    @note = @cocktail.note
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    redirect_to new_cocktail_dose_path(@cocktail) if @cocktail.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :note)
  end
end
