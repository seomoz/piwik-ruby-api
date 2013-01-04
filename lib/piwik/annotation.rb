module Piwik
  class Annotation < Base
    def save
      Piwik::Annotations.save(attributes)
    end
    
    def delete
      Piwik::Annotations.delete(attributes)
    end
  end
end