require 'rubygems'
require 'test/unit'
#require 'stringio'
#require 'open-uri'
#require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'simple-piwik'

class Test::Unit::TestCase
  def stub_rails_env &block
    Object.const_set("RAILS_ROOT", File.join(File.dirname(__FILE__),"files"))
    yield
  end
end
