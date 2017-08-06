require 'rails_helper'

RSpec.describe Responsible, type: :model do 

  it 'has a valid factory' do
    expect(create(:responsible)).to be_persisted
  end 
  
  it 'is valid with valid atributes' do 
    responsible = create(:student) 
    expect(responsible).to be_valid
  end

  it 'is invalid with invalid atributes' do
    responsible = Student.new
    expect(responsible).to_not be_valid
  end

  describe 'validations shoulda matchers' do
    subject(:responsible) { create(:responsible)}
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:student_id)}
  end
     
end 