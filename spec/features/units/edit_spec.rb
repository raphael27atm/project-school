require 'rails_helper'

describe "Editing units" do
  let(:user) { create(:user) }
  
  before(:each) do 
    sign_in_user(user)
    @unit = create(:unit)
  end

  it "is successful with valid content" do
    visit units_path
    
    within("#unit_#{@unit.id}") do
      find(".fa-edit").click
    end
    
    visit edit_unit_path(@unit)
    
    fill_in "unit_name", with: "Nome Editado"
    click_button "Editar"

    expect(page).to have_content("Unidade editada com sucesso")
    
    @unit.reload

    expect(@unit.name).to eq("Nome Editado")
  end

  it "is unsuccessful with no content" do
    visit edit_unit_path(@unit)

    fill_in "unit_name", with: ""
    
    click_button "Editar"

    expect(page).to_not have_content("Unidade editada com sucesso")
    expect(page).to have_content("Erro ao editar a unidade")
    
    @unit.reload
    expect(@unit.name).to eq(@unit.name)
  end

end