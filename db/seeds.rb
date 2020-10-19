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

Cocktail.create(name: "Gin", photo: "https://images.unsplash.com/photo-1453824979084-c8fd42932378?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80")
Cocktail.create(name: "Caipirinha", photo:"https://images.unsplash.com/photo-1570813092574-b4cccfc58f9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80")
Cocktail.create(name: "Margarita", photo: "https://images.unsplash.com/photo-1541976076758-347942db1975?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1494&q=80")
Cocktail.create(name: "Martini", photo: "https://images.unsplash.com/photo-1575023782549-62ca0d244b39?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80")
Cocktail.create(name: "Mojito", photo: "https://images.unsplash.com/photo-1510626176961-4b57d4fbad03?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80")


# to see in the terminal
# curl -s https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
