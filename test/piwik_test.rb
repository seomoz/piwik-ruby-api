require File.join(File.dirname(__FILE__),"test_helper")

class PiwikTest < Test::Unit::TestCase
  def setup
    
  end
  
  def test_can_read_standalone_config
    File.open(File.join(ENV["HOME"],".piwik"), "w") { p.puts(File.read("./files/config/piwik/yml")) } unless File.join(ENV["HOME"],".piwik")
    assert_nothing_raised do
      Piwik::Base.load_config_from_file
    end
  end
  
  def test_can_read_rails_config
    stub_rails_env do
      assert_nothing_raised do
        Piwik::Base.load_config_from_file
      end
    end
  end
end
