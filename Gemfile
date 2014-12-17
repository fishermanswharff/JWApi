source 'https://rubygems.org'
ruby "2.1.2"
gem 'rails', '4.2.0.beta2'
gem 'rails-api'
gem 'active_model_serializers', github: 'rails-api/active_model_serializers'
gem 'rack-cors', require: 'rack/cors'
gem 'pg'
gem 'bcrypt-ruby', '~> 3.1.2'
gem 'aws-sdk'
gem 'arel', '6.0.0.beta2'
gem 'newrelic_rpm'

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'spring'
  gem "factory_girl_rails", "~> 4.0"
  gem "faker"
end

group :test do 
  gem "codeclimate-test-reporter", require: nil
end

group :development do
  gem 'unicorn'
end