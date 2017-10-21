Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each { |f| require f }

RACK_ENV ||= ENV["RACK_ENV"] || "development"

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
