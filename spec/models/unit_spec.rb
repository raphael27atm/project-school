require 'rails_helper'

RSpec.describe Unit, type: :model do 
  include_examples "address", "unit"

  it 'has a valid factory' do
    expect(create(:unit)).to be_persisted
  end
  
  it 'is valid with valid atributes' do
    unit = create(:unit) 
    expect(unit).to be_valid
  end

  it 'is invalid with invalid atributes' do
    unit = Unit.new
    expect(unit).to_not be_valid
  end

  describe 'validations shoulda matchers' do
    subject(:unit) { create(:unit)}
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:school_id)}
  end
     
end 