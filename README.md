# Autometal::Piwik

A simple Ruby client for the Piwik API. This gem's 0.x versions are based on Rodrigo Tassinari de Oliveira’s piwik gem (github.com/riopro/piwik). Since it hasn’t been updated since 2008, I took the liberty to fork it, and finish it up.

Version 1.0.0 is a rewrite and extension of this work.

## Installation

Add this line to your application's Gemfile:

    gem 'autometal-piwik'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install autometal-piwik

## Usage

Piwik is an open source web analytics software, written in PHP. It provides an extensive REST-like API, and this gem aims to be a simple Ruby wrapper to access this API in a Ruby-friendly way. For example:

    require 'rubygems'
    require 'piwik'
    site = Piwik::Site.load(1, 'http://your.piwi.install', 'some_auth_key')
    => #<Piwik::Site:0xb74bf994 @name="Example.com", @config={:auth_token=>"some_auth_key", :piwik_url=>"http://your.piwi.install"}, @id=1, @main_url="http://www.example.com", @created_at=Tue Jul 15 18:55:40 -0300 2008>
    site.pageviews(:month, Date.today)
    => 88
    
    user = Piwik::User.load(1, 'http://your.piwi.install', 'some_auth_key')
    => #<Piwik::User:0xb66bf544 @login="Example.com", @config={:auth_token=>"some_auth_key", :piwik_url=>"http://your.piwi.install"}, @id=1, @main_url="http://www.example.com", @created_at=Tue Jul 15 18:55:40 -0300 2008>

For more information on Piwik and it’s API, see the [Piwik website](piwik.org) and the [Piwik API reference](http://dev.piwik.org/trac/wiki/API/Reference).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
