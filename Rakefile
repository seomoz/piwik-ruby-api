require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/piwik'

Hoe.plugin :newgem
$hoe = Hoe.spec 'autometal-piwik' do
  self.developer 'Achillefs Charmpilas', 'ac@humbuckercode.co.uk'
  self.post_install_message = File.read('PostInstall.txt')
  self.rubyforge_name       = self.name
  self.extra_deps         = [['active_support','>= 2.3.8']]
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }