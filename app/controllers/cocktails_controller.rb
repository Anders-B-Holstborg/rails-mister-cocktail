class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    args = cocktail_params
    args['user_id'] = current_user.id
    @cocktail = Cocktail.new(args)
    if @cocktail.save
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @cocktail = find_cocktail
    @doses = []
    @cocktail.doses.each do |dose|
      @doses << dose
    end
    @note = @cocktail.note
  end

  def edit
    @cocktail = find_cocktail
  end

  def update
    @cocktail = find_cocktail
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail = find_cocktail
    if @cocktail.destroy
      redirect_to cocktails_path
    else
      render :new
    end
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :note, :user_id)
  end
end
