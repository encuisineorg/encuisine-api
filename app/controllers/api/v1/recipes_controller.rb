# frozen_string_literal: true

module Api
  module V1
    class RecipesController < ApplicationController
      def show
        recipe = Recipe.find(params[:id])
        render json: recipe.to_json(include: [:ingredients])
      end

      def create
        recipe = Recipe.new(recipe_params)
        recipe.ingredients.each do |ingredient|
          next if ingredient.food_id.present?
          ingredient.food = Food.search_by_name(ingredient.name).first_or_create
        end
        if recipe.save
          render json: recipe.to_json(include: [:ingredients])
        else
          render json: recipe.errors, status: 422
        end
      end

      private

      def recipe_params
        params.require(:recipe).permit(
          :author,
          :content,
          :license,
          :source_url,
          :title,
          ingredients_attributes: [
            :name,
            :quantity,
            :unit,
            :food_id
          ]
        )
      end
    end
  end
end
