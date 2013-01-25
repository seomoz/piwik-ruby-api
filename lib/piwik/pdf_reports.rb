module Piwik
  class PdfReports < ApiModule
    AVAILABLE_METHODS = %W{
      addReport
      updateReport
      deleteReport
      getReports
      generateReport
      sendReport
    }
    
    AVAILABLE_METHODS.each do |method|
      class_eval %{
        class #{self.api_call_to_const(method)} < Piwik::ApiResponse
        end
      }, __FILE__, __LINE__
    end
  end
end