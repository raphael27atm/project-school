require 'rails_helper'

RSpec.describe Teacher, type: :model do 

  it 'has a valid factory' do
    expect(create(:teacher)).to be_persisted
  end 
  
  it 'is valid with valid atribut es' do 
    teacher = create(:teacher) 
    expect(teacher).to be_valid
  end

  it 'is invalid with invalid atributes' do
    teacher = Teacher.new
    expect(teacher).to_not be_valid
  end

  describe 'validations shoulda matchers' do
    subject(:teacher) { create(:teacher)}
    it { should belong_to(:unit) }
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:unit_id)}
  end
     
end 