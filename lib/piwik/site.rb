module Piwik
  class Site < Base
    api_scope :referers
    
    # Gives read access (<tt>'view'</tt>) to the supplied user login for the current
    # site.
    def give_view_access_to(login)
      give_access_to(:view, login)
    end
    
    # Gives read and write access (<tt>'admin'</tt>) for the supplied user login for the 
    # current site.
    def give_admin_access_to(login)
      give_access_to(:admin, login)
    end
    
    # Removes all access (gives an <tt>'noaccess'</tt>) for the supplied user login for 
    # the current site.
    def give_no_access_to(login)
      give_access_to(:noaccess, login)
    end
    alias_method :remove_access_for, :give_no_access_to
    
    def summary(period=:day, date=Date.today)
      VisitsSummary.get(id_attr => self.id, :period => period, :date => date)
    end
    
    def visits(period=:day, date=Date.today)
      Piwik::VisitsSummary.getVisits(id_attr => id, :period => period, :date => date).value
    end
    
    def unique_visitors(period=:day, date=Date.today)
      Piwik::VisitsSummary.getUniqueVisitors(id_attr => id, :period => period, :date => date).value
    end
    
    def actions(period=:day, date=Date.today)
      Piwik::VisitsSummary.getActions(id_attr => id, :period => period, :date => date).value
    end
    
    def bounce_count(period=:day, date=Date.today)
      Piwik::VisitsSummary.getBounceCount(id_attr => id, :period => period, :date => date).value
    end
    
    def sum_visits_length(period=:day, date=Date.today)
      Piwik::VisitsSummary.getSumVisitsLength(id_attr => id, :period => period, :date => date).value
    end
    
    def annotations
      Piwik::Annotations.getAll(id_attr => id)
    end
    
    class << self
      def collection
        Piwik::SitesManager
      end
      
      def id_attr
        :idSite
      end
    end
    
    private
      # Gives the supplied access for the supplied user, for the current site.
      # 
      # * <tt>access</tt> can be one of <tt>:view</tt>, <tt>:admin</tt> or <tt>:noaccess</tt>
      # * <tt>login</tt> is the user login on Piwik
      def give_access_to(access, login)
        Piwik::UsersManager.setUserAccess(:idSites => id, :access => access.to_s, :userLogin => login.to_s).data
      end
  end
end