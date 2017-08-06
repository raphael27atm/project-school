require 'rails_helper'

RSpec.describe Role, type: :model do 
  let(:role) { create(:role) }

  it 'has a valid factory' do
    expect(role).to be_persisted
  end
  
  it 'is valid with valid atributes' do
    expect(role).to be_valid
  end

  it 'is invalid with invalid atributes' do
    role = Role.new
    expect(role).to_not be_valid
  end

  describe 'validations shoulda matchers' do
    subject(:role) { create(:role)}
    it { is_expected.to validate_presence_of(:name)}
  end
     
end 