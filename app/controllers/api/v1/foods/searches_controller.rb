# frozen_string_literal: true

module Api
  module V1
    module Foods
      class SearchesController < ApplicationController
        def show
          pagy, foods = pagy(Food.search_by_name(params[:q]))
          render json: foods.to_json
        end

        def create
          pagy, foods = pagy(Food.search_by_name(params[:q]))
          render json: foods.to_json
        end
      end
    end
  end
end
