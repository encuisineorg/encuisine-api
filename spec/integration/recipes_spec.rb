# frozen_string_literal: true

require 'swagger_helper'

describe 'Recipes API' do
  path '/api/v1/recipes/searches' do
    post 'Search a recipe' do
      tags 'Recipes'
      produces 'application/json'
      parameter name: :q, in: :headers, type: :string

      response '200', 'recipes' do
        let(:q) { "Smoothie" }
        run_test!
      end
    end
  end

  path '/api/v1/recipes/{id}' do
    get 'Retrieves a recipe' do
      tags 'Recipes'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'recipe found' do
        let(:id) { Recipe.create(
          author: "Nous",
          content: "Coupez les fruits en morceaux. Ajoutez le lait. Mixez le tout. A déguster frais.",
          license: "CC0",
          source_url: "https://encuisine.org",
          title: "Smoothie banane fraise",
          total_minutes: 5
        ).id }
        schema type: :object,
          properties: {
          id: { type: :uuid },
          author: { type: :string },
          content: { type: :string },
          ingredients: {
            type: :array,
            items: {
              type: :object,
              properties: {
                id: { type: :uuid },
                food_id: { type: :uuid },
                name: { type: :string },
                quantity: { type: :integer },
                unit: { type: :string },
                created_at: { type: :string, format: :datetime },
                updated_at: { type: :string, format: :datetime }
              }
            }
          },
          license: { type: :string },
          source_url: { type: :string },
          title: { type: :string },
          total_minutes: { type: :integer },
          created_at: { type: :string, format: :datetime },
          updated_at: { type: :string, format: :datetime }
        }
        run_test!
      end
    end
  end

  path '/api/v1/recipes' do
    post 'Creates a recipe' do
      tags 'Recipes'
      consumes 'application/json'
      parameter name: :recipe, in: :body, schema: {
        type: :object,
        properties: {
          author: { type: :string },
          content: { type: :string },
          ingredients_attributes: {
            type: :array,
            items: {
              type: :object,
              properties: {
                name: { type: :string },
                quantity: { type: :integer },
                unit: { type: :string },
                food_id: { type: :uuid }
              }
            }
          },
          license: { type: :string },
          source_url: { type: :string },
          title: { type: :string },
          total_minutes: { type: :integer }
        }
      }

      response '200', 'recipe created' do
        let(:recipe) {
          {
            recipe: {
              author: "Nous",
              content: "Coupez les fruits en morceaux. Ajoutez le lait. Mixez le tout. A déguster frais.",
              ingredients_attributes: [
                {
                  name: "Banane",
                  quantity: 1
                },
                {
                  name: "Fraise",
                  quantity: 2
                },
                {
                  name: "Lait",
                  quantity: 5,
                  unit: "cL"
                }
              ],
              license: "CC0",
              source_url: "https://encuisine.org",
              title: "Smoothie banane fraise",
              total_minutes: 5
            }
          }
        }
        run_test!
      end

      response '422', 'unprocessable entity' do
        let(:recipe) {
          {
            recipe: {
              author: "Nous"
            }
          }
        }
        run_test!
      end
    end
  end
end
