require 'rails_helper'

describe "Adding units" do
  let(:user) { create(:user) }
  let(:address) { create(:address) }
  let(:unit) { create(:unit) }
  
  before(:each) do 
    sign_in_user(user)
    create_list(:unit, 10)
  end

  it "is successful with valid content" do
    visit units_path
    click_link "Adicionar nova unidade"
    fill_in "unit_name", with: unit.name
    find("#unit_address_attributes_state", address.state)
    fill_in "unit_address_attributes_city", with: address.city
    fill_in "unit_address_attributes_number", with: address.number
    fill_in "unit_address_attributes_street", with: address.street
    fill_in "unit_address_attributes_neighborhood", with: address.neighborhood
    fill_in "unit_address_attributes_complement", with: address.complement
    click_button "Salvar"
    
    expect(page).to have_content("Unidades")
    
  end

  it "displays an error with no content" do
    visit units_path
    click_link "Adicionar nova unidade"
    fill_in "unit_name", with: ""
    fill_in "unit_address_attributes_city", with: ""
    fill_in "unit_address_attributes_number", with: ""
    click_button "Salvar"
    within("div.alert") do
      expect(page).to have_content("Foi encontrado os sequintes erros: [\"Address number não pode ficar em branco\"")
    end
  end

end