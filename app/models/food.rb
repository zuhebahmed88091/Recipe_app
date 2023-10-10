class Food < ApplicationRecord
  belongs_to :user
  has_many :food_recipes
  has_many :recipes, through: :recipe_foods
end
