module Piwik
  module Trackable
    def piwik_tracking_js
      if Config.use_async
        <<-code
        <!-- Piwik -->
        <script type="text/javascript">
        var _paq = _paq || [];
        (function(){
            var u=(("https:" == document.location.protocol) ? "https://#{Config.url}" : "http://#{Config.url}");
            _paq.push(['setSiteId', #{@site.piwik_id}]);
            _paq.push(['setTrackerUrl', u+'piwik.php']);
            _paq.push(['trackPageView']);
            var d=document,
                g=d.createElement('script'),
                s=d.getElementsByTagName('script')[0];
                g.type='text/javascript';
                g.defer=true;
                g.async=true;
                g.src=u+'piwik.js';
                s.parentNode.insertBefore(g,s);
        })();
        </script>
        <!-- End Piwik Tag -->
        code
      else
        <<-code
        <!-- Piwik -->
        <script type="text/javascript">
        var pkBaseURL = (("https:" == document.location.protocol) ? "https://#{Config.url}" : "http://#{Config.url}");
        document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
        </script><script type="text/javascript">
        try {
                var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", #{@site.piwik_id});
                piwikTracker.trackPageView();
                piwikTracker.enableLinkTracking();
        } catch( err ) {}
        </script>
        <!-- End Piwik Tag -->
        code
      end
    end

    def add_piwik_analytics_tracking
      if Config.use_async
        self.response.body = response.body.sub!(/<\/[hH][eE][aA][dD]>/, "#{piwik_tracking_js}</head>") if response.body.respond_to?(:sub!)
      else
        self.response.body = response.body.sub!(/<\/[bB][oO][dD][yY]>/, "#{piwik_tracking_js}</body>") if response.body.respond_to?(:sub!)
      end
    end
  end

  class PiwikConfigurationError < StandardError; end

  class Config

    @@use_async = false
    cattr_accessor :use_async
    
    @@url = Piwik::Base.load_config_from_file[:piwik_url]
    cattr_accessor :url
    
    @@environments = ["production","development"]
    cattr_accessor :environments

    @@formats = [:html, :all]
    cattr_accessor :formats

=begin rdoc
  Checks whether the model can be tracked using piwik by checking for a piwik_id and domain fields.
  This is a pretty specific use case, a more generic application tracking solution is available here:
  https://github.com/Achillefs/piwik_analytics/ (this file is actually swiped from that plugin)
=end
    def self.enabled?(format)
      raise Piwik::PiwikConfigurationError if (@site and @site.piwik_id.blank?) || url.blank?
      environments.include?(Rails.env) && formats.include?(format.to_sym)
    end
  end
end