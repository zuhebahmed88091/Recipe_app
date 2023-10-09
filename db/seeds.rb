# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(name: 'Juarez')
Food.create!(name: 'Beef', measurement_unit: 'g', quantity: 5000, price: 700, user_id: 1)
Food.create!(name: 'Rice', measurement_unit: 'g', quantity: 10000, price: 200, user_id: 1)
Food.create!(name: 'Potato', measurement_unit: 'g', quantity: 5000, price: 150, user_id: 1)
Food.create!(name: 'Eggs', measurement_unit: 'unit', quantity: 500, price: 150, user_id: 1)
Food.create!(name: 'Tomato', measurement_unit: 'g', quantity: 5000, price: 100, user_id: 1)
Food.create!(name: 'Onion', measurement_unit: 'g', quantity: 4000, price: 80, user_id: 1)
Food.create!(name: 'Garlic', measurement_unit: 'g', quantity: 2000, price: 60, user_id: 1)
Recipe.create!(name: 'Bife a Cavalo', preparation_time: 10, cooking_time: 20, description: 'Bife a Cavalo is a traditional Brazilian dish consisting of a steak, rice, french fries and a fried egg.', public: true, user_id: 1)
RecipeFood.create!(quantity: 300, food_id: 1, recipe_id: 1)
RecipeFood.create!(quantity: 350, food_id: 2, recipe_id: 1)
RecipeFood.create!(quantity: 100, food_id: 3, recipe_id: 1)
RecipeFood.create!(quantity: 1, food_id: 4, recipe_id: 1) 
RecipeFood.create!(quantity: 150, food_id: 5, recipe_id: 1)
RecipeFood.create!(quantity: 200, food_id: 6, recipe_id: 1)
RecipeFood.create!(quantity: 50, food_id: 7, recipe_id: 1)

