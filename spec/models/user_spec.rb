require 'rails_helper'

RSpec.describe User, type: :model do
  let(:role){ create(:role)}

  it 'is valid with valid atributes' do

    user = create(:user, role: role)
    expect(user).to be_valid
  end

  it 'is invalid with invalid atributes' do
    user = User.new
    expect(user).to_not be_valid
  end

  it 'is invalid with invalid name' do
    user = build(:user, name: "", role: role)
    expect(user).to_not be_valid
  end

  it 'is invalid with invalid email' do
    user = build(:user, role: role, email: "emai.com")
    expect(user).to_not be_valid
  end

  describe 'validations shoulda matchers' do
    subject(:user) { create(:user, role: role)}
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:email)}
    it { is_expected.to validate_presence_of(:role)}
  end
  
end 