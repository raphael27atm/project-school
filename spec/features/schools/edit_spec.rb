require 'rails_helper'

describe "Editing schools" do
  let(:user) { create(:user) }
  let(:address) { create(:address) }
  
  before(:each) do 
    sign_in_user(user)
    @school = create(:school)
    @address = create(:address, addressable_id: @school.id, addressable_type: 'School')
  end

  it "is successful with valid content" do
    visit schools_path
  
    within dom_id_for(@school) do
      find(".fa-edit").click 
    end 
    
    visit edit_school_path(@school)
    
    fill_in "school_name", with: "Nome Editado"
    find("#school_address_attributes_state", address.state)
    fill_in "school_address_attributes_city", with: address.city
    fill_in "school_address_attributes_number", with: address.number
    fill_in "school_address_attributes_street", with: address.street
    fill_in "school_address_attributes_neighborhood", with: address.neighborhood
    fill_in "school_address_attributes_complement", with: address.complement
    
    click_button "Editar"

    expect(page).to have_content("Escola foi atualizado com sucesso")
    
    @school.reload

    expect(@school.name).to eq("Nome Editado")
  end

  it "is unsuccessful with no content" do
    visit edit_school_path(@school)

    fill_in "school_name", with: ""
    
    click_button "Editar"

    expect(page).to have_content("não pode ficar em branco")
    
    @school.reload
    expect(@school.name).to eq(@school.name)
  end

end