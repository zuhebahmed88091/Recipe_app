class RecipesController < ApplicationController
    def index
        @user = current_user
        @recipes = @user.recipes
    end

    def show
        @recipe = Recipe.find(params[:id])
        @recipe_foods = @recipe.recipe_foods
    end

    def new
        @recipe = Recipe.new
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to recipes_path
    end
end
