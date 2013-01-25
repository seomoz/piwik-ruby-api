module Piwik
  class PdfReports < ApiModule
    available_methods %W{
      addReport
      updateReport
      deleteReport
      getReports
      generateReport
      sendReport
    }
  end
end