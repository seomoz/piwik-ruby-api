module Piwik
  class Site < Base
    api_scope :referers
    api_scope :visits, :class_name => 'VisitsSummary'
    api_scope :actions
    api_scope :transitions
    
    # Gives read access (<tt>'view'</tt>) to the supplied user login for the current site.
    def give_view_access_to(login)
      give_access_to(:view, login)
    end
    
    # Gives read and write access (<tt>'admin'</tt>) for the supplied user login for the current site.
    def give_admin_access_to(login)
      give_access_to(:admin, login)
    end
    
    # Removes all access (gives a <tt>'noaccess'</tt>) for the supplied user login for the current site.
    def give_no_access_to(login)
      give_access_to(:noaccess, login)
    end
    alias_method :remove_access_for, :give_no_access_to
    
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