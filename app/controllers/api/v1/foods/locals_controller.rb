# frozen_string_literal: true

module Api
  module V1
    module Foods
      class LocalsController < ApplicationController
        def show
          pagy, foods = pagy(Food.local)
          render json: foods.to_json
        end
      end
    end
  end
end
