module Piwik
  class LanguagesManager < ApiModule
    available_methods %W{
      isLanguageAvailable
      getAvailableLanguages
      getAvailableLanguagesInfo
      getAvailableLanguageNames
      getTranslationsForLanguage
      getLanguageForUser
      setLanguageForUser
    }
  end
end