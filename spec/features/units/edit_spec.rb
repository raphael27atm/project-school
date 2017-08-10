require 'rails_helper'

describe "Editing units" do
  let(:user) { create(:user) }
  let(:address) { create(:address) }
  
  before(:each) do 
    sign_in_user(user)
    @unit = create(:unit)
    @address = create(:address, addressable_id: @unit.id, addressable_type: 'Unit')
  end

  it "is successful with valid content" do
    visit edit_unit_path(@unit)
    
    fill_in "unit_name", with: "Nome Editado"
    find("#unit_address_attributes_state", address.state)
    fill_in "unit_address_attributes_city", with: address.city
    fill_in "unit_address_attributes_number", with: address.number
    fill_in "unit_address_attributes_street", with: address.street
    fill_in "unit_address_attributes_neighborhood", with: address.neighborhood
    fill_in "unit_address_attributes_complement", with: address.complement
    
    click_button "Editar"

    expect(page).to have_content("Unidade foi atualizado com sucesso")
    
    @unit.reload
 
    expect(@unit.name).to eq("Nome Editado")
  end

  it "is unsuccessful with no content" do
    visit edit_unit_path(@unit)

    fill_in "unit_name", with: ""
    
    click_button "Editar"

    expect(page).to have_content("não pode ficar em branco")
    
    @unit.reload
    expect(@unit.name).to eq(@unit.name)
  end

end