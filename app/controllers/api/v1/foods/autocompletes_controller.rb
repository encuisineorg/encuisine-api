# frozen_string_literal: true

module Api
  module V1
    module Foods
      class AutocompletesController < ApplicationController
        def show
          foods = Food.search_by_name(params[:q])
          render json: foods.select(
            :id,
            :name,
          ).to_json
        end
      end
    end
  end
end
