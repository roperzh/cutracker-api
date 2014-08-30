require_relative '../app.rb'

ENV["RACK_ENV"] = "test"

require "bundler"
Bundler.setup(:default, :test)

if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start do
    add_filter "/test/"
    add_filter "/vendor/bundle"
  end
end

# load test-specific environment variables
require "dotenv"
Dotenv.load ".env.test", ".env"

require "minitest/autorun"
require "rack/test"

require "minitest/reporters"
Minitest::Reporters.use!

# Allow usage of 'context' like 'describe'
class MiniTest::Spec
  class << self
    alias_method :context, :describe
  end
end

require "factory_girl"

# Include Factory Girl
class MiniTest::Spec
  include FactoryGirl::Syntax::Methods
end
