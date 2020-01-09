require 'open-uri'
require 'json'

Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

scraped_ingredients = open(url).read

e_ingredients = JSON.parse(scraped_ingredients)

e_ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end
