ENV["SINATRA_ENV"] ||= "development"

task :console do
    Pry.start
end

task :mytask => :dotenv do
    Dotenv.load
end

require_relative './config/environment'
require 'sinatra/activerecord/rake'
require 'dotenv/tasks'