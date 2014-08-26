require "cuba"
require "rack/protection"

Cuba.use Rack::Session::Cookie, key: ENV["APP_KEY"], secret: ENV["APP_SECRET"]
Cuba.use Rack::Protection::RemoteReferrer
Cuba.use Rack::MethodOverride
Cuba.use Rack::Protection
