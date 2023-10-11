require 'rails_helper'

RSpec.feature 'Public recipes List', type: :feature do
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

  public_recipes = Recipe.where(public: true)
  def confirm_user_email(user)
    user.update(confirmed_at: Time.now)
  end

  before do
    confirm_user_email(user)
    sign_in(user)
    visit public_recipes_path
  end

  it 'displays a list of recipes' do
    public_recipes.each do |r|
      expect(page).to have_content(r.name)
      expect(page).to have_content("By: #{r.user.name}")
      total_items = r.recipe_foods.length
      expect(page).to have_content("Total food items: #{total_items}")
      total_price = r.recipe_foods.sum { |recipe_food| recipe_food.food.price * recipe_food.quantity }
      expect(page).to have_content("Total price: #{total_price}")
    end
  end
end
