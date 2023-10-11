# spec/features/recipes_spec.rb

require 'rails_helper'

RSpec.feature 'Recipes', type: :feature do
  user = User.find_or_create_by(id: 123) do |u|
    u.name = 'John'
    u.email = 'john@email.com'
    u.password = 'john123'
  end

  recipe1 = Recipe.find_or_create_by(id: 55) do |r|
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

  RecipeFood.find_or_create_by(id: 30) do |rf|
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
    visit recipes_path
  end

  scenario 'User can see the list of recipes' do
    expect(page).to have_link('Add New Recipe', href: new_recipe_path)
    expect(page).to have_content(recipe1.name)
    expect(page).to have_content("Description: #{recipe1.description}")
    expect(page).to have_content("Preparation Time: #{recipe1.preparation_time} minutes")
    expect(page).to have_content("Cooking Time: #{recipe1.cooking_time} minutes")
    expect(page).to have_button('REMOVE', exact: true)
  end
end
