module Piwik
  class User < Base
    class << self
      def collection
        Piwik::UsersManager
      end
      
      def id_attr
        :userLogin
      end
    end
  end
end