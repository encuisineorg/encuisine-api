# frozen_string_literal: true

module Api
  module V1
    class FoodsController < ApplicationController
      def index
        if params[:q]
          pagy, foods = pagy(Food.search_by_name(params[:q]))
        else
          pagy, foods = pagy(Food.all)
        end
        render json: foods.select(
          :id,
          :name,
          :emoji,
          :months,
          :local,
          :pef,
          :co2,
          :ciqual_code,
          :ciqual_grp_code,
          :ciqual_ssgrp_code,
          :ciqual_ssssgrp_code,
        ).to_json
      end

      def show
        food = Food.find(params[:id])
        render json: food.to_json
      end
    end
  end
end
