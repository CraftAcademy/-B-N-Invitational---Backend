source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.3.4'
gem 'active_model_serializers', '~> 0.10.0'
gem 'aws-sdk-s3', require: false
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.0.0'
gem 'devise'
gem 'devise_token_auth'
gem 'jquery-rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 5.2.0.rc2'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks'
gem 'uglifier', '>= 2.7.2'


group :development, :test do
  gem 'coveralls', require: false
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'launchy'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'jsonapi-rspec', require: false
end
