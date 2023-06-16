# frozen_string_literal: true

module Api
  module V1
    module Foods
      class LocalSeasonalsController < ApplicationController
        def show
          pagy, foods = pagy(Food.local.seasonal)
          render json: foods.to_json
        end
      end
    end
  end
end
