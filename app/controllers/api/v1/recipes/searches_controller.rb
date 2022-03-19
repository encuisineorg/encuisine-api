# frozen_string_literal: true

module Api
  module V1
    module Recipes
      class SearchesController < ApplicationController
        def create
          recipe = Recipe.find_by_title(params[:q])
          render json: recipe.to_json(include: [:ingredients])
        end
      end
    end
  end
end
