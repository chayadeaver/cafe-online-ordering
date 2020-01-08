ENV['SINATRA_ENV'] ||= "development"
ENV["RACK_ENV"] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])


require './app/controllers/application_controller'
# require 'sinatra/flash'
require_all 'app'
require 'securerandom'
require 'dotenv'

