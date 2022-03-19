# frozen_string_literal: true

module Api
  module V1
    class FoodsController < ApplicationController
      def show
        food = Food.find(params[:id])
        render json: food.to_json
      end
    end
  end
end
