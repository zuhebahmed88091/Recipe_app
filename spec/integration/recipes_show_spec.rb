# spec/features/recipe_details_spec.rb

require 'rails_helper'

RSpec.feature 'Recipe Details', type: :feature do
  user = User.find_or_create_by(id: 123) do |u|
    u.name = 'John'
    u.email = 'john@email.com'
    u.password = 'john123'
  end

  recipe = Recipe.find_or_create_by(id: 55) do |r|
    r.name = 'Chow'
    r.description = 'Fried chow'
    r.preparation_time = 10
    r.cooking_time = 10
    r.user_id = user.id
  end

  food = Food.find_or_create_by(id: 55) do |f|
    f.name = 'Flour'
    f.measurement_unit = 'g'
    f.price = 2
    f.quantity = 100
    f.user = user
  end

  recipe_food = RecipeFood.find_or_create_by(id: 55) do |rf|
    rf.quantity = 10
    rf.recipe_id = recipe.id
    rf.food_id = food.id
  end

  def confirm_user_email(user)
    user.update(confirmed_at: Time.now)
  end

  before do
    confirm_user_email(user)
    sign_in(user)
    visit recipe_path(recipe)
  end

  scenario 'User can see recipe details' do
    expect(page).to have_content(recipe.name)
    expect(page).to have_content("Preparation Time: #{recipe.preparation_time} minutes")
    expect(page).to have_button('Toggle', class: 'btn btn-primary')
    expect(page).to have_content("Cooking Time: #{recipe.cooking_time} minutes")
    expect(page).to have_content("Description: #{recipe.description}")
    expect(page).to have_button('Generate Shopping List')
    expect(page).to have_link('Add Ingredient', href: new_recipe_recipe_food_path(recipe_id: recipe.id))
    expect(page).to have_content(recipe_food.food.name)
    expect(page).to have_content(recipe_food.quantity)
    expect(page).to have_content(recipe_food.food.price * recipe_food.quantity)
    expect(page).to have_button('Edit')
    expect(page).to have_button('Delete')
  end
end
