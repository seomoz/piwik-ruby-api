# Piwiker [![Build Status](https://travis-ci.org/Achillefs/autometal-piwik.png?branch=v1.x)](https://travis-ci.org/Achillefs/autometal-piwik)

Version 1.0.0 is a ground-up rewrite of the older autometal-piwik gem, itself based [on work](http://github.com/riopro/piwik) by Rodrigo Tassinari de Oliveira. It aspires to completely cover the Piwik API and be easily extendable by its users. To achieve that, we will not be making any assumptions on how you wanna use your data, so we will closely mirror Piwik's API structure even if it looks kinda weird to a modern rubyist.

We will also implement an extended `Piwik::Site` meta class that will give you ruby-friendly access to a lot of the data in a way we think is sane, but it will be up to you which interface you want to use.

## Installation

Add this line to your application's Gemfile:

    gem 'piwiker', :require => 'piwik'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install piwiker

## Usage

Piwik is an open source web analytics software, written in PHP. It provides an extensive REST-like API, and this gem aims to be a simple Ruby wrapper to access this API in a Ruby-friendly way. For example:

    require 'rubygems'
    require 'piwik'
    site = Piwik::Site.load(1, 'http://your.piwi.install', 'some_auth_key')
    => #<Piwik::Site:0xb74bf994 @name="Example.com", @config={:auth_token=>"some_auth_key", :piwik_url=>"http://your.piwik.install"}, @id=1, @main_url="http://www.example.com", @created_at=Tue Jul 15 18:55:40 -0300 2008>
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
