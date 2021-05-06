source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.3.1'
# Use Puma as the app server
gem 'puma', '~> 5.2.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.16'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.7.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

# JSON web tokens
gem 'jwt', '~> 2.2.2'

# Active model serializers
gem 'active_model_serializers', '~> 0.10.12'

# pagination
gem 'will_paginate', '~> 3.3.0'

# environmental variables
gem 'dotenv-rails', '~> 2.7.6'

# Patch actionpack
gem "actionpack", ">= 6.1.3.2"

group :development, :test do
  # Use MySQL as the database for Active Record
  gem 'mysql2', '~> 0.5.3'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 11.1.3', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.4.1'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.1'
  gem 'rubocop', '~> 1.11.0'
end

group :test do
  # 'factory_bot_rails' cames not to behave right in 5.0 or more
  gem 'factory_bot_rails', '~> 6.1.0'
  gem 'rspec-rails', '~> 4.0.2'
  gem 'faker', '~> 2.16.0'
  gem 'shoulda-matchers', '~> 4.5.1'
  gem 'database_cleaner', '~> 2.0.1'
end

group :production do
  gem 'pg', '~> 1.2.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
