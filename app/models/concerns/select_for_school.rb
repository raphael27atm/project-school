module SelectForSchool
  extend ActiveSupport::Concern
  included do

    scope :select_data, -> (school){
      joins(:unit)
      .where('units.school_id = ?', school)
    }

  end
end   