module Piwik
  class Site < Base
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
    alias_method :remove_access_from, :give_no_access_to
    
    # Returns a hash with a summary of access information for the current site 
    # (visits, unique visitors, actions / pageviews, maximum actions per visit, 
    # bounces and total time spent in all visits in seconds), filtered by the 
    # supplied period and date.
    # 
    # * <tt>period</tt> should be one of <tt>:day</tt>, <tt>:week</tt>, <tt>:month</tt> or <tt>:year</tt> (default: <tt>:day</tt>)
    # * <tt>date</tt> should be a <tt>Date</tt> object (default: <tt>Date.today</tt>)
    # 
    # Equivalent Piwik API call: VisitsSummary.get (idSite, period, date)
    def summary(period=:day, date=Date.today)
      raise UnknownSite, "Site not existent in Piwik yet, call 'save' first" if new?
      xml = call('VisitsSummary.get', :idSite => id, :period => period, :date => date)
      result = parse_xml(xml)
      {
        :visits => result['nb_visits'].to_i,
        :unique_visitors => result['nb_uniq_visitors'].to_i,
        :actions => result['nb_actions'].to_i,
        :max_actions_per_visit => result['max_actions'].to_i,
        :bounces => result['bounce_count'].to_i,
        :total_time_spent => result['sum_visit_length'].to_i, # in seconds
      }
    end
    
    # Returns the amount of visits for the current site, filtered by the 
    # supplied period and date.
    # 
    # * <tt>period</tt> should be one of <tt>:day</tt>, <tt>:week</tt>, <tt>:month</tt> or <tt>:year</tt> (default: <tt>:day</tt>)
    # * <tt>date</tt> should be a <tt>Date</tt> object (default: <tt>Date.today</tt>)
    # 
    # Equivalent Piwik API call: VisitsSummary.getVisits (idSite, period, date)
    def visits(period=:day, date=Date.today)
      raise UnknownSite, "Site not existent in Piwik yet, call 'save' first" if new?
      xml = call('VisitsSummary.getVisits', :idSite => id, :period => period, :date => date)
      result = parse_xml(xml)
      result.to_i
    end
    
    # Returns the amount of unique visitors for the current site, filtered by 
    # the supplied period and date.
    # 
    # * <tt>period</tt> should be one of <tt>:day</tt>, <tt>:week</tt>, <tt>:month</tt> or <tt>:year</tt> (default: <tt>:day</tt>)
    # * <tt>date</tt> should be a <tt>Date</tt> object (default: <tt>Date.today</tt>)
    # 
    # Equivalent Piwik API call: VisitsSummary.getUniqueVisitors (idSite, period, date)
    def unique_visitors(period=:day, date=Date.today)
      raise UnknownSite, "Site not existent in Piwik yet, call 'save' first" if new?
      xml = call('VisitsSummary.getUniqueVisitors', :idSite => id, :period => period, :date => date)
      result = parse_xml(xml)
      result.to_i
    end
    
    # Returns the amount of actions (pageviews) for the current site, filtered 
    # by the supplied period and date.
    # 
    # * <tt>period</tt> should be one of <tt>:day</tt>, <tt>:week</tt>, <tt>:month</tt> or <tt>:year</tt> (default: <tt>:day</tt>)
    # * <tt>date</tt> should be a <tt>Date</tt> object (default: <tt>Date.today</tt>)
    # 
    # Equivalent Piwik API call: VisitsSummary.getActions (idSite, period, date)
    def actions(period=:day, date=Date.today)
      raise UnknownSite, "Site not existent in Piwik yet, call 'save' first" if new?
      xml = call('VisitsSummary.getActions', :idSite => id, :period => period, :date => date)
      result = parse_xml(xml)
      result.to_i
    end
    alias_method :pageviews, :actions
    
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
      # 
      # Equivalent Piwik API call: UsersManager.setUserAccess (userLogin, access, idSites)
      def give_access_to(access, login)
        raise UnknownSite, "Site not existent in Piwik yet, call 'save' first" if new?
        xml = call('UsersManager.setUserAccess', :idSites => id, :access => access.to_s, :userLogin => login.to_s)
        result = parse_xml(xml)
        result['success'] ? true : false
      end
  end
end