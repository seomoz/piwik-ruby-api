module Piwik
  class Annotations < ApiModule
    AVAILABLE_METHODS = %W{
      getAll
      getAnnotationCountForDates
    }
    
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
    
    AVAILABLE_METHODS.each do |method|
      class_eval %{
        class #{self.api_call_to_const(method)} < Piwik::ApiResponse
        end
      }, __FILE__, __LINE__
    end
  end
end