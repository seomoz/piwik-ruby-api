# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{autometal-piwik}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Achillefs Charmpilas"]
  s.date = %q{2011-01-17}
  s.description = %q{A simple Ruby client for the Piwik API.}
  s.email = ["ac@humbuckercode.co.uk"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "Todo.txt", "website/index.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "Rakefile", "Todo.txt", "config/hoe.rb", "config/requirements.rb", "lib/piwik.rb", "lib/piwik/base.rb", "lib/piwik/site.rb", "lib/piwik/user.rb", "lib/piwik/version.rb", "script/console", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "spec/piwik_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/rspec.rake", "tasks/website.rake", "website/index.html", "website/index.txt", "website/javascripts/rounded_corners_lite.inc.js", "website/stylesheets/screen.css", "website/template.html.erb"]
  s.homepage = %q{http://piwik.rubyforge.org}
  s.post_install_message = %q{
For more information on piwik, see http://piwik.rubyforge.org or 
http://github.com/Achillefs/piwik/

}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{autometal-piwik}
  s.rubygems_version = %q{1.4.2}
  s.summary = %q{A simple Ruby client for the Piwik API.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<active_support>, [">= 2.3.8"])
      s.add_development_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_development_dependency(%q<hoe>, [">= 2.6.2"])
    else
      s.add_dependency(%q<active_support>, [">= 2.3.8"])
      s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_dependency(%q<hoe>, [">= 2.6.2"])
    end
  else
    s.add_dependency(%q<active_support>, [">= 2.3.8"])
    s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
    s.add_dependency(%q<hoe>, [">= 2.6.2"])
  end
end
