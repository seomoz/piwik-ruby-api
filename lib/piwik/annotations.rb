module Piwik
  class Annotations < ApiModule
    available_methods %W{
      get
      add
      save
      delete
      getAll
      getAnnotationCountForDates
    }
    
    scoped_methods do
      def load note_id
        get(defaults.merge(:idNote => note_id))
      end
      
      def all params = {}
        getAll(defaults.merge(params))
      end
      
      # params: ( date, note, starred = '0')
      def add params = {}
        super(defaults.merge(params))
      end
      
      # params:  (date = '', note = '', starred = '')
      def update note_id, params = {}
        save(defaults.merge(params).merge(:idNote => note_id))
      end

      def delete note_id
        super(defaults.merge(:idNote => note_id))
      end
      
      # params: (date, period, lastN = '', getAnnotationText = '')
      def count_for_dates params = {}
        getAnnotationCountForDates(defaults.merge(params))
      end
    end
  end
end