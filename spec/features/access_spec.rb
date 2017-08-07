require 'rails_helper'

feature 'As a user' do
  let(:role) { create(:role) }
  let(:school) { create(:school) }
  let(:user) { create(:user, role: role, school_id: school.id) } 
  let(:user_invalid) { build(:user, role: role) }
  
  describe "If I'm only a user" do
    scenario "I should be able to access user panel and redirected after login" do
      visit new_user_session_path
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_on "Entrar"  
      expect(page).to have_content "Resumo"
    end 

    scenario "Credentials invalid" do 
      visit new_user_session_path
      fill_in "user_email", with: user_invalid.email
      fill_in "user_password", with: user_invalid.password
      click_on "Entrar" 
      expect(page).to have_content "Usuário não cadastrado."
    end

    scenario "I cannot access user panel" do 
      visit root_path
      expect(page).to have_content "Você precisa registrar-se ou fazer login para continuar."
    end
  end
end