%W[ stringio test/unit open-uri #{File.dirname(__FILE__)}/../lib/piwik.rb ].each { |r| require r }

class Test::Unit::TestCase
  def stub_rails_env &block
    Object.const_set("RAILS_ROOT", File.join(File.dirname(__FILE__),"files"))
    yield
  end
end
