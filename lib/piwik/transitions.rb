module Piwik
  class Transitions < ApiModule
    available_methods %W{
      getTransitionsForPageTitle
      getTransitionsForPageUrl
      getTransitionsForAction
      getTranslations
    }
    
    scoped_methods do
      def for_title title, params = {}
        getTransitionsForPageTitle(defaults.merge(params).merge(:pageTitle => title))
      end

      def for_url url, params = {}
        getTransitionsForPageUrl(defaults.merge(params).merge(:pageUrl => url))
      end

      def for_action name, type, params = {}
        getTransitionsForAction(defaults.merge(params).merge(:actionName => name, :actionType => type, :parts => 'all', :returnNormalizedUrls => ''))
      end

      def translations
        getTranslations
      end
    end
  end
end