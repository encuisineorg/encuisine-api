source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

gem "bootsnap", require: false # Reduces boot times through caching; required in config/boot.rb
gem "nokogiri" # Work with XML and HTML [https://github.com/sparklemotion/nokogiri]
gem "pagy" # The Best Pagination Ruby Gem [https://github.com/ddnexus/pagy]
gem "pg", "~> 1.1" # Use pg as the database for Active Record
gem "pg_search" # Builds named scopes that take advantage of PostgreSQL's full text search [https://github.com/Casecommons/pg_search]
gem "puma", "~> 5.0" # Use the Puma web server [https://github.com/puma/puma]
gem "rails", "~> 7.0.2", ">= 7.0.2.3" # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rswag-api" # Rswag extends rspec-rails "request specs" with a Swagger-based DSL [https://github.com/rswag/rswag]
gem "rswag-ui" # Rswag extends rspec-rails "request specs" with a Swagger-based DSL [https://github.com/rswag/rswag]
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem

# gem "bcrypt", "~> 3.1.7" # Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "image_processing", "~> 1.2" # Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "jbuilder" # Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "kredis" # Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "rack-cors" # Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "redis", "~> 4.0" # Use Redis adapter to run Action Cable in production

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails" # RSpec testing framework for Ruby on Rails [https://github.com/rspec/rspec-rails]
  gem "rswag-specs" # Rswag extends rspec-rails "request specs" with a Swagger-based DSL [https://github.com/rswag/rswag]
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem "annotate" # Add a comment summarizing the current schema [https://github.com/ctran/annotate_models]
  gem "rubocop", require: false # Ruby static code analyzer (a.k.a. linter) and code formatter [https://github.com/rubocop/rubocop/]
end

