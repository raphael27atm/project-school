require 'rails_helper'

RSpec.describe Team, type: :model do 

  it 'has a valid factory' do
    expect(create(:team)).to be_persisted
  end
  
  it 'is valid with valid atributes' do
    team = create(:team) 
    expect(team).to be_valid
  end

  it 'is invalid with invalid atributes' do
    team = Team.new
    expect(team).to_not be_valid
  end

  describe 'validations shoulda matchers' do
    subject(:team) { create(:team)}
    it { should belong_to(:unit) }
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:unit_id)}
  end
     
end 