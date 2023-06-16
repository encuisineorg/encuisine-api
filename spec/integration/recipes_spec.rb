# frozen_string_literal: true

require 'swagger_helper'

describe 'Recipes API' do
  path '/api/v1/recipes/autocomplete' do
    get 'Autocomplete search in recipes' do
      tags 'Recipes'
      produces 'application/json'
      parameter name: :q, in: :query, type: :string

      response '200', 'recipes' do
        let(:q) { "Smoo" }
        run_test!
      end
    end
  end

  path '/api/v1/recipes/search' do
    get 'Search in all recipes' do
      tags 'Recipes'
      produces 'application/json'
      parameter name: :q, in: :query, type: :string
      parameter name: :page, in: :query, type: :integer

      response '200', 'recipes' do
        let(:q) { "Smoothie" }
        let(:page) { 1 }
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
          cook_time_in_minutes: 0,
          license: "CC0",
          prep_time_in_minutes: 5,
          recipe_category: "Vegan",
          recipe_yield: 2,
          source_url: "https://encuisine.org",
          title: "Smoothie banane fraise",
          total_minutes: 5
        ).id }
        schema type: :object,
          properties: {
          id: { type: :string },
          author: { type: :string },
          content: { type: :string },
          cook_time_in_minutes: { type: :integer },
          ingredients: {
            type: :array,
            items: {
              type: :object,
              properties: {
                id: { type: :string },
                food_id: { type: :string },
                name: { type: :string },
                quantity: { type: :integer },
                recipe_id: { type: :string },
                unit: { type: :string },
                created_at: { type: :string, format: :datetime },
                updated_at: { type: :string, format: :datetime }
              }
            }
          },
          license: { type: :string },
          prep_time_in_minutes: { type: :integer },
          recipe_category: { type: :string },
          recipe_yield: { type: :integer },
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
          cook_time_in_minutes: { type: :integer },
          content: { type: :string },
          ingredients_attributes: {
            type: :array,
            items: {
              type: :object,
              properties: {
                name: { type: :string },
                quantity: { type: :integer },
                unit: { type: :string },
                food_id: { type: :string }
              }
            }
          },
          license: { type: :string },
          prep_time_in_minutes: { type: :integer },
          recipe_category: { type: :string },
          recipe_yield: { type: :integer },
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
              recipe_category: "Vegan",
              recipe_yield: 2,
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

describe 'Foods API' do
  path '/api/v1/foods/autocomplete' do
    get 'Autocomplete search in foods' do
      tags 'Foods'
      produces 'application/json'
      parameter name: :q, in: :query, type: :string

      response '200', 'foods' do
        let(:q) { "Bana" }
        run_test!
      end
    end
  end

  path '/api/v1/foods/local' do
    get 'List local foods' do
      tags 'Foods'
      produces 'application/json'
      parameter name: :page, in: :query, type: :integer

      response '200', 'foods' do
        let(:page) { 1 }
        run_test!
      end
    end
  end

  path '/api/v1/foods/seasonal' do
    get 'List seasonal foods' do
      tags 'Foods'
      produces 'application/json'
      parameter name: :page, in: :query, type: :integer

      response '200', 'foods' do
        let(:page) { 1 }
        run_test!
      end
    end
  end

  path '/api/v1/foods/local_seasonal' do
    get 'List local and seasonal foods' do
      tags 'Foods'
      produces 'application/json'
      parameter name: :page, in: :query, type: :integer

      response '200', 'foods' do
        let(:page) { 1 }
        run_test!
      end
    end
  end

  path '/api/v1/foods/search' do
    get 'Search in all foods' do
      tags 'Foods'
      produces 'application/json'
      parameter name: :q, in: :query, type: :string
      parameter name: :page, in: :query, type: :integer

      response '200', 'foods' do
        let(:q) { "Banane" }
        let(:page) { 1 }
        run_test!
      end
    end
  end

  path '/api/v1/foods/{id}' do
    get 'Retrieves a food' do
      tags 'Foods'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'food found' do
        let(:id) { Food.create(
          name: "Banane",
        ).id }
        schema type: :object,
          properties: {
          id: { type: :string },
          name: { type: :string },
          created_at: { type: :string, format: :datetime },
          updated_at: { type: :string, format: :datetime }
        }
        run_test!
      end
    end
  end
end
