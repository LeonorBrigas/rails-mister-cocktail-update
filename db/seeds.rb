# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts "destroy ingredients"
Ingredient.destroy_all if Rails.env.development?

puts "destroy cocktails"
Cocktail.destroy_all if Rails.env.development?

puts "Creating ingredients"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create(name: ingredient["strIngredient1"])
  puts "create #{i.name} "
end

puts "Creating cocktails"

Cocktail.create(name: "sex on the beach")
Cocktail.create(name: "gin")
Cocktail.create(name: "caipirinha")

# to see in the terminal
# curl -s https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
