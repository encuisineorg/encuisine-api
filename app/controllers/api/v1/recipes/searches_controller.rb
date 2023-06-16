# frozen_string_literal: true

module Api
  module V1
    module Recipes
      class SearchesController < ApplicationController
        def show
          pagy, recipes = pagy(Recipe.search_by_title(params[:q]))
          render json: recipes.to_json(include: [:ingredients])
        end
      end
    end
  end
end
