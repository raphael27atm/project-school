require 'rails_helper'

RSpec.describe School, type: :model do 
  include_examples "address", "school"

  it 'has a valid factory' do
    expect(create(:school)).to be_persisted
  end
  
  it 'is valid with valid atributes' do
    school = create(:school) 
    expect(school).to be_valid
  end

  it 'is invalid with invalid atributes' do
    school = School.new
    expect(school).to_not be_valid
  end

  describe 'validations shoulda matchers' do
    subject(:school) { create(:school)}
    it { is_expected.to validate_presence_of(:name)}
  end
     
end 