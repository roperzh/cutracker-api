require "bundler"
rack_env = ENV.fetch("RACK_ENV", "development").to_sym
Bundler.setup(:default, rack_env)

require "rake/testtask"
require "rake/clean"

CLEAN.push "coverage"

task :environment do
  require "dotenv"
  Dotenv.load ".env.#{rack_env}", ".env"
end

Rake::TestTask.new(:spec) do |t|
  t.libs << "spec"
  t.pattern = "spec/**/*_spec.rb"
  t.verbose = true
end
task :default => :spec

desc "Run tests for spec with coverage"
task "spec:coverage" do
  ENV["COVERAGE"] = "true"
  Rake::Task["spec"].invoke
end

desc "Run a interactive console (IRB)"
task :console => :environment do
  ARGV.clear

  require "irb"
  IRB.start
end
