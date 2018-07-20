RACK_ENV = 'test' unless defined?(RACK_ENV)
require "factory_bot"
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
Dir[File.expand_path(File.dirname(__FILE__) + "/../app/helpers/**/*.rb")].each(&method(:require))


RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include FactoryBot::Syntax::Methods
  conf.before(:suite) do
    FactoryBot.find_definitions
  end

  FactoryBot.define do
    to_create { |instance| instance.save(raise_on_failure: true) }
  end
end

# You can use this method to custom specify a Rack app
# you want rack-test to invoke:
#
#   app Devolute::App
#   app Devolute::App.tap { |a| }
#   app(Devolute::App) do
#     set :foo, :bar
#   end
#
def app(app = nil, &blk)
  @app ||= block_given? ? app.instance_eval(&blk) : app
  @app ||= Padrino.application
end
