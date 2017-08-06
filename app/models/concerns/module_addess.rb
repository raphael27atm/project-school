module ModuleAddess
  extend ActiveSupport::Concern
  included do
    has_one :address, as: :addressable
    accepts_nested_attributes_for :address

    def has_complete_registration?
      if !self.address.nil? && self.address.valid?
        errors.clear
        return true
      else
        errors.clear
        return false
      end
    end

    def has_address?
      !self.address.nil? && self.address.valid?
    end
    
  end
end
