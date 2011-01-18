require File.join(File.dirname(__FILE__),"test_helper")

class PiwikTest < Test::Unit::TestCase
  def setup
    @domain = "http://test.local"
    @name = "Test Site"
    @site = Piwik::Site.new(:name => @name, :main_url => @domain)
    @login = "test_user"
    @password = "changeme"
    @email = "test@pwave.com"
    @user_alias = "Test User"
    @user = Piwik::User.new(:login => @login, :password => @password, :email => @email, :user_alias => @user_alias)
  end
  
  def test_can_instantiate_site
    assert_equal @name, @site.name
    assert_equal @domain, @site.main_url
  end
  
  def test_can_save_and_destroy_site
    assert_equal nil, @site.id
    @site.save
    assert_not_equal 0, @site.id
    assert_not_equal nil, @site.id
    assert_equal true, @site.destroy
  end
  
  def test_can_instantiate_user
    assert_equal @login, @user.login
    assert_equal @password, @user.password
    assert_equal @email, @user.email
    assert_equal @user_alias, @user.user_alias
  end
  
  def test_can_save_and_destroy_user
    @user.save
    assert_equal true, @user.destroy
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
