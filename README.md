# En Cuisine ! API

API de recettes libres !

🧑🏻‍🍳 Voir la [feuille de route publique de En Cuisine !](https://github.com/orgs/encuisineorg/projects/1)

🙏🏻 Merci de noter que nous avons un [code de conduite](https://github.com/encuisineorg/roadmap/blob/main/CODE_OF_CONDUCT.md), veuillez le suivre dans toutes vos interactions avec le projet.

🧑🏻‍💻 Vous êtes un développeur, un designer UI/UX et vous voulez aider ? Lisez le [guide de contribution](https://github.com/encuisineorg/roadmap/blob/main/CONTRIBUTING.md).

## Getting started

### Requirements

- Ruby 3.1.1 or higher
- bundler - `gem install bundler`
- PostgreSQL

### Initial setup

1. Customize the `config/database.yml`
2. Run `bin/setup`

### Running En Cuisine ! API

1. Run `bin/rails s`

### Run the test suite

1. Run `bundle exec rspec`

### Generate the Swagger JSON file

1. Run `bin/rails rswag:specs:swaggerize`
