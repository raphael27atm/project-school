require 'rails_helper'

RSpec.describe Student, type: :model do 

  it 'has a valid factory' do
    expect(create(:student)).to be_persisted
  end 
  
  it 'is valid with valid atributes' do 
    student = create(:student) 
    expect(student).to be_valid
  end

  it 'is invalid with invalid atributes' do
    student = Student.new
    expect(student).to_not be_valid
  end

  describe 'validations shoulda matchers' do
    subject(:student) { create(:student)}
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:unit_id)}
  end
     
end 