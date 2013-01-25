module Piwik
  class UserCountry < ApiModule
    available_methods %W{
      getCountry
      getContinent
      getRegion
      getCity
      getLocationFromIP
      getNumberOfDistinctCountries
    }
  end
end