require 'rails_helper'

describe "Editing users" do
  let(:user) { create(:user) }
  let(:address) { create(:address) }
  
  before(:each) do 
    sign_in_user(user)
    @school = create(:school)
    @role = create(:role)
  end

  it "is successful with valid content" do
    visit edit_user_path(user)
  
    fill_in "user_name", with: "Nome Editado" 
     
    click_button "Editar"
 
    expect(page).to have_content("Usuário foi atualizado com sucesso")
    
    user.reload

    expect(user.name).to eq("Nome Editado")
  end

  it "is unsuccessful with no content" do
    visit edit_user_path(user)

    fill_in "user_name", with: ""
    
    click_button "Editar"

    expect(page).to have_content("não pode ficar em branco")
    
    user.reload
    expect(user.name).to eq(user.name)
  end

end