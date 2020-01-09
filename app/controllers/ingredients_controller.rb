class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Restaurant.find(@ingredient)
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(params[@ingredient])
    @ingredient.save

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
