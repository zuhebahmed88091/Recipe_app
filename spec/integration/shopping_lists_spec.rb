# In your spec/features/shopping_list_spec.rb file

require 'rails_helper' # Assuming you are using Rails, adjust accordingly if not

RSpec.describe 'Shopping List', type: :feature do
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
    visit shopping_lists_path
  end

  it 'calculates the total items and total value correctly' do
    expect(page).to have_text('Amount of food items to buy: 1')
    expect(page).to have_text('Total value of food needed: 200')
  end
end
