require 'rails_helper'

RSpec.describe User, type: :model do
  let(:role){ create(:role)}
  let(:school){ create(:school)}

  it 'is valid with valid atributes' do

    user = create(:user, role: role, school_id: school.id)
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
    subject(:user) { create(:user, role: role, school_id: school.id)}
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:email)}
    it { is_expected.to validate_presence_of(:email)}
    it { is_expected.to validate_presence_of(:school_id)}
    it { is_expected.to validate_presence_of(:role_id)}
  end
  
end 