class RecipesController < ApplicationController
  def public_recipes
    @public_recipes = Recipe.where(public: true).includes(recipe_foods: :food).order(created_at: :desc)
  end

  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  def new
    @recipe = Recipe.new
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(public: !@recipe.public)
      redirect_to @recipe, notice: 'Recipe public status was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end

  def calculate_total_price(recipe)
    total_price = 0.0

    recipe.recipe_foods.each do |recipe_food|
      total_price += recipe_food.food.price * recipe_food.quantity
    end

    total_price
  end
end
