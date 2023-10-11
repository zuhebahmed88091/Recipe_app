FactoryBot.define do
  factory :food do
    name { 'Beef' }
    measurement_unit { 'g' }
    price { 0.7 }
    quantity { 1000 }
    user # Use association without :factory
    # Remove the association for recipe_food
  end
end

FactoryBot.define do
  factory :user do
    name { 'Example User' }
    email { 'user@example.com' }
    password { 'password123' }
    food # Use association without :factory
    # Remove the association for recipe
  end
end

FactoryBot.define do
  factory :recipe do
    name { 'Beef Stew' }
    preparation_time { 10 }
    cooking_time { 20 }
    description { 'A delicious beef stew' }
    public { true }
    user # Use association without :factory
    # Remove the association for recipe_food
  end
end

FactoryBot.define do
  factory :recipe_food do
    quantity { 500 }
    recipe # Use association without :factory
    food # Use association without :factory
  end
end
