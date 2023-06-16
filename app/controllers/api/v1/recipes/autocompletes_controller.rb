# frozen_string_literal: true

module Api
  module V1
    module Recipes
      class AutocompletesController < ApplicationController
        def show
          recipes = Recipe.search_by_title(params[:q])
          render json: recipes.select(
            :id,
            :title,
          ).to_json
        end
      end
    end
  end
end
