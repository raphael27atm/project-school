require 'rails_helper'

RSpec.describe User, type: :model do
  let(:role){ create(:role)}
  let(:school){ create(:school)}
  subject(:user) { create(:user, role: role, school_id: school.id)}

  it 'is valid with valid atributes' do
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

  describe "#generate_authentication_token!" do
    it { should validate_uniqueness_of(:auth_token)} 

    it "generates another token when one already has been taken" do
      existing_user = create(:user, auth_token: "auniquetoken123")
      user.generate_auth_token
      expect(user.auth_token).not_to eql existing_user.auth_token
    end
  end

  describe 'validations shoulda matchers' do
    it { should belong_to(:school) }
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:email)}
    it { is_expected.to validate_presence_of(:email)}
    it { is_expected.to validate_presence_of(:school_id)}
    it { is_expected.to validate_presence_of(:role_id)}
  end
  
end 