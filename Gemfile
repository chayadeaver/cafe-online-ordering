source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'thin'
gem 'shotgun'
gem 'rack'
gem 'bcrypt'
gem 'tux'
gem 'sinatra-flash', '~> 0.3.0'
gem 'require_all'
gem 'rake'

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

group :development, :test do
  gem 'pry'
end

group :production do
  gem 'pg'
end
