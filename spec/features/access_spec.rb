require 'rails_helper'

feature 'As a user' do
  before(:each ) do 
    @user = build(:user)
  end

  describe "If I'm only a user" do
    scenario "I should be able to access user panel and redirected after login"

    scenario "I cannot access user panel"

    scenario "I should not be able to see the change to user panel"

    scenario "I should be able to recover my password"

    scenario "Signing out"
  end
end