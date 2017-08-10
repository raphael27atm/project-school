require 'rails_helper'

describe "Adding users" do
  let(:user) { create(:user) }
  let(:address) { create(:address) }
  let(:user) { create(:user) }
  
  before(:each) do 
    sign_in_user(user)
    create_list(:school, 2)
  end

  it "is successful with valid content" do
    visit users_path
    click_link "Adicionar novo usuário"
    fill_in "user_name", with: user.name
    click_button "Salvar"
    
    expect(page).to have_content("Usuários")
  end

  it "displays an error with no content" do
    visit users_path
    click_link "Adicionar novo usuário"
    fill_in "user_name", with: ""
    click_button "Salvar"
    
    expect(page).to have_content("não pode ficar em branco")
  end

end