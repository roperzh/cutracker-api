require "bundler"
require "dotenv"

rack_env = ENV.fetch("RACK_ENV", "development").to_sym
Dotenv.load ".env.#{rack_env}", ".env"

require "./app"
run Cuba
