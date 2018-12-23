require 'open-uri'

Cocktail.destroy_all

Cocktail.create(name: "Pina Colada", photo: "image/upload/v1542368044/u111k1mon3w6v25ee5zq.jpg")
Cocktail.create(name: "Pina Colada2", photo: "image/upload/v1542368044/u111k1mon3w6v25ee5zq.jpg")
Cocktail.create(name: "Pina Colada3", photo: "image/upload/v1542368044/u111k1mon3w6v25ee5zq.jpg")
Cocktail.create(name: "Pina Colada4", photo: "image/upload/v1542368044/u111k1mon3w6v25ee5zq.jpg")
Cocktail.create(name: "Pina Colada5", photo: "image/upload/v1542368044/u111k1mon3w6v25ee5zq.jpg")

Ingredient.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

serialized_ingredients = open(url).read

ingredients = JSON.parse(serialized_ingredients)

ingredients["drinks"].each do |h|
  ingredient = h["strIngredient1"]
  Ingredient.create(name: ingredient)
end
