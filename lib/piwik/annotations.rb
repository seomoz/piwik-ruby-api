module Piwik
  class Annotations < ApiModule
    available_methods %W{
      get
      add
      getAll
      getAnnotationCountForDates
    }
    
    def self.get params
      resp = self.api_call('get',params)
      Piwik::Annotation.new(resp)
    end
    
    def self.add params
      resp = self.api_call('add',params)
      Piwik::Annotation.new(resp)
    end
    
    def self.save params
      resp = self.api_call('save',params)
      Piwik::Annotation.new(resp)
    end
    
    def self.delete params
      self.api_call('delete',params)
    end
  end
end