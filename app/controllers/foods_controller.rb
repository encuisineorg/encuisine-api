# frozen_string_literal: true

class FoodsController < ApplicationController
  def show
    food = Food.find(params[:id])
    render json: food.to_json
  end
end
