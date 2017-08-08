module SelectForSchool
  extend ActiveSupport::Concern
  included do
    
    def self.select_data(school)
        self.all.joins(:unit)
          .where('units.school_id = ?', school)
    end

  end
end   