require 'rubygems'
require 'test/unit'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'piwik'

class Test::Unit::TestCase
  def stub_rails_env &block
    Object.const_set("RAILS_ROOT", File.join(File.dirname(__FILE__),"files"))
    yield
  end
end
