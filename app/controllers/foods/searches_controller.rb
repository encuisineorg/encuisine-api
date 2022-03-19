# frozen_string_literal: true

module Foods
  class SearchesController < ApplicationController
    def create
      foods = Food.search_by_name(params[:q])
      render json: foods.to_json
    end
  end
end
