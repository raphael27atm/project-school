require 'rails_helper'

shared_examples_for 'address' do |factory_name|
  let(:address) { create(:address) }
  
  describe 'has_complete_registration?' do
    it "returns true if all required fields are filled" do
      data = build(factory_name, address: address)
      expect(data.has_complete_registration?).to be true
    end

    it "returns false if any required fields aren't filled" do
      data = build(factory_name)
      expect(data.has_complete_registration?).to be false
    end
  end

  describe 'has_address?' do
    it "returns true if all required fields are filled" do
      data = build(factory_name, address: address)
      expect(data.has_address?).to be true
    end

    it "returns false if any required fields aren't filled" do
      data = build(factory_name)
      expect(data.has_address?).to be false
    end
  end

end