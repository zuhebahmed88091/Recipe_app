# spec/features/food_list_spec.rb

require 'rails_helper'

RSpec.feature 'Food List', type: :feature do
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
    visit foods_path
  end

  scenario 'visiting the food list page' do
    expect(page).to have_content(food.name)
    expect(page).to have_content(food.measurement_unit)
    expect(page).to have_content(food.price)
    expect(page).to have_content(food.quantity)

    click_link 'Add food'
    expect(page).to have_current_path(user_session_path)
  end
end
