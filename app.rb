require "bundler"
require "cuba"
require "rack/protection"
require "mongoid"

Cuba.use Rack::Session::Cookie, key: ENV["APP_KEY"], secret: ENV["APP_SECRET"]
Cuba.use Rack::Protection::RemoteReferrer
Cuba.use Rack::MethodOverride
Cuba.use Rack::Protection

# load database configuration
Mongoid.load!("config/mongoid.yml")

# require application files
Dir["./app/helpers/**/*.rb"].each { |f| require(f) }
Dir["./app/models/**/*.rb"].each  { |f| require(f) }
Dir["./app/routes/**/*.rb"].each  { |f| require(f) }
