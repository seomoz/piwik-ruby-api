#require 'rubygems'
#require 'fileutils'
#require './lib/piwik'

task :default => [:test]

desc "test"
task :test do 
  require 'rake/runtest'
  Rake.run_tests "#{File.expand_path(File.dirname(__FILE__))}/test/*test.rb"
end