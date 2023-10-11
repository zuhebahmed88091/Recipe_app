require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'name, preparation_time, cooking_time, user should be present' do
    user = User.new(name: 'Zuheb', email: 'zuheb@email', password: '123456')
    recipe = Recipe.new(name: 'Kebab', preparation_time: '50', cooking_time: '75', description: 'Sample recipe', user:)
    expect(recipe).to be_valid
  end

  it 'name should be present' do
    user = User.new(name: 'Zuheb', email: 'zuheb@email', password: '123456')
    recipe = Recipe.new(preparation_time: '50', cooking_time: '75', user:)
    expect(recipe).to_not be_valid
  end

  it 'preparation_time should be present' do
    user = User.new(name: 'Zuheb', email: 'zuheb@email', password: '123456')
    recipe = Recipe.new(name: 'Kebab', cooking_time: '75', user:)
    expect(recipe).to_not be_valid
  end

  it 'preparation_time should be positive' do
    user = User.new(name: 'Zuheb', email: 'zuheb@email', password: '123456')
    recipe = Recipe.new(name: 'Kebab', preparation_time: '50', cooking_time: '75', user:)
    expect(recipe).to_not be_valid
  end

  it 'cooking_time should be present' do
    user = User.new(name: 'Zuheb', email: 'zuheb@email', password: '123456')
    recipe = Recipe.new(name: 'Kebab', preparation_time: '50', user:)
    expect(recipe).to_not be_valid
  end

  it 'cooking_time should be positive' do
    user = User.new(name: 'Zuheb', email: 'zuheb@email', password: '123456')
    recipe = Recipe.new(name: 'Kebab', preparation_time: '50', cooking_time: '-1', user:)
    expect(recipe).to_not be_valid
  end

  it 'user should be present' do
    recipe = Recipe.new(name: 'Kebab', preparation_time: '50', cooking_time: '75')
    expect(recipe).to_not be_valid
  end
end