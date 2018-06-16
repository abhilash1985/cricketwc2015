ruby '2.1.2'

source 'http://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use sqlite3 as the database for Active Record
gem 'mysql2'

if Rails.env.production?
  gem 'pg'
end
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'
gem 'cancancan'
gem 'kaminari'

gem 'carrierwave'
gem 'spreadsheet'
gem 'rails_admin'
gem 'jquery-final_countdown-rails'
gem 'nprogress-rails'

gem 'bower-rails'
gem 'angularjs-rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'

#for the bootstrap
gem 'bootstrap-sass', '~> 3.3.3'
gem 'autoprefixer-rails'
gem 'bootstrap-multiselect-rails'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'pry'
  gem 'web-console', '~> 2.0'
  gem 'binding_of_caller'
  gem 'better_errors'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'rails_best_practices', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  #gem 'brakeman', '2.6.3', require: false
  gem 'flog', require: false
  gem 'flay', require: false
end

group :test do
  gem 'simplecov'
  gem 'simplecov-rcov'
  gem 'rspec-rails', '~> 2.0'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'capybara'
  gem 'database_cleaner'
  # gem 'selenium-webdriver'
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'codeclimate-test-reporter', require: nil
end
