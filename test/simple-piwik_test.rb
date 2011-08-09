#require File.join(File.expand_path(File.dirname(__FILE__)),"test_helper")
require 'test_helper'

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
  
  def test_can_save_load_update_and_destroy_site
    assert_equal nil, @site.id
    @site.save
    assert_not_equal 0, @site.id
    assert_not_equal nil, @site.id
    reloaded = Piwik::Site.load(@site.id)
    assert_equal reloaded.id, @site.id
    reloaded.name = "Changed Name"
    reloaded.update
    reloaded = Piwik::Site.load(@site.id)
    assert_equal "Changed Name", reloaded.name
    assert_equal true, reloaded.destroy
  end
  
  def test_can_instantiate_user
    assert_equal @login, @user.login
    assert_equal @password, @user.password
    assert_equal @email, @user.email
    assert_equal @user_alias, @user.user_alias
  end
  
  def test_can_save_load_update_and_destroy_user
    @user.save
    reloaded = Piwik::User.load(@user.login)
    assert_equal reloaded.login, @user.login
    reloaded.email = "changed@mail.com"
    reloaded.password = "changeme"
    reloaded.update
    reloaded = Piwik::User.load(@user.login)
    assert_equal"changed@mail.com", reloaded.email
    assert_equal true, @user.destroy
  end
  
  def test_can_read_standalone_config
    File.open(File.join(ENV["HOME"],".piwik"), "w") { p.puts(File.read("./files/config/piwik/yml")) } unless File.join(ENV["HOME"],".piwik")
    assert_nothing_raised do
      Piwik::Base.load_config
    end
  end
  
  def test_can_read_rails_config
    stub_rails_env do
      assert_nothing_raised do
        Piwik::Base.load_config
      end
    end
  end

  def test_can_be_configured
    stub_rails_env do
      #configuring manualy overrides the config file settings, if any
      Piwik.piwik_url  = "url"
      Piwik.auth_token = "token"
      assert_equal true, Piwik.is_configured?
      assert_nothing_raised do
        Piwik::Base.load_config
        assert_equal "url", Piwik.piwik_url 
        assert_equal "token", Piwik.auth_token
      end
      Piwik.piwik_url  = nil
      Piwik.auth_token = nil
    end
  end

end
