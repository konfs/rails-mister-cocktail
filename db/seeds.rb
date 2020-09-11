
require 'open-uri'

Ingredient.destroy_all
Cocktail.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

list = JSON.parse(open(url).read)

# list['drinks'][0]['strIngredient1']

list['drinks'].each do |ingredient|
    Ingredient.create(name: ingredient['strIngredient1'])
end

cocktails = ["Mint Julep", "Whiskey Sour", "Mojito"]

cocktails.each do |cocktail|
    Cocktail.create(name: cocktail)
end