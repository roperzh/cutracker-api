require "cuba"

Cuba.use Rack::Session::Cookie, key: ENV["APP_KEY"], secret: ENV["APP_SECRET"]
Cuba.use Rack::MethodOverride
