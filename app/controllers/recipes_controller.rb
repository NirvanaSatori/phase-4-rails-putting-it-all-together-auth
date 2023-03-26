class RecipesController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    def index
        recipe = Recipe.all 
        render json: recipe.to_json(include: :user)
    end

    def create
        recipe = @current_user.recipes.create!(recipe_params)
        render json: recipe.to_json(include: :user), status: :created
    end

    private
    def recipe_params
        params.permit(:instructions, :minutes_to_complete, :title)
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity   
    end

end
