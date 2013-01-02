require 'piwik'

RSpec.configure do |config|
  require 'factory_girl'
  Dir[File.join(File.dirname(__FILE__),'spec','support''**','*.rb')].each {|f| require f}
  config.mock_with :rspec
  config.order = "random"
  config.include FactoryGirl::Syntax::Methods
  FactoryGirl.find_definitions
  #config.before(:suite) do
  #  @domain = "http://test.local"
  #  @key
  #end
end

def stub_rails_env &block
  Object.const_set("RAILS_ROOT", File.join(File.dirname(__FILE__),"files"))
  yield
  Object.const_set("RAILS_ROOT",nil)
end