module Piwik
  class MultiSites < ApiModule
    available_methods %W{
      getAll
      getOne
    }
  end
end