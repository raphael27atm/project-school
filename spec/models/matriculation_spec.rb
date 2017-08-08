require 'rails_helper'

RSpec.describe Matriculation, type: :model do 
  let(:student) { create(:student) }
  let(:team) { create(:team) }
  let(:matriculation) { create(:matriculation, student_id: student.id, team_id: team.id) }

  it 'has a valid factory' do
    expect(matriculation).to be_persisted
  end
  
  it 'is valid with valid atributes' do 
    expect(matriculation).to be_valid
  end

  it 'is invalid with invalid atributes' do
    matriculation = Matriculation.new
    expect(matriculation).to_not be_valid
  end

  describe 'validations shoulda matchers' do
    subject(:matriculation) { create(:matriculation, student_id: student.id, team_id: team.id)}
    it { is_expected.to validate_presence_of(:number)}
    it { is_expected.to validate_presence_of(:student_id)}
    it { is_expected.to validate_presence_of(:team_id)}
  end
     
end 