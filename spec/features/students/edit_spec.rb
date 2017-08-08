require 'rails_helper'

describe "Editing students" do
  let(:user) { create(:user) }
  let(:unit) { create(:unit) }
  
  before(:each) do 
    sign_in_user(user)
    @student = create(:student, unit_id: unit.id)
  end

  it "is successful with valid content" do
    visit edit_student_path(@student)
    
    find("#student_name", "Nome Editado")
    find(:css, "select#student_unit_id").set(@student.unit_id)
   
    click_button "Editar"
  
    expect(page).to have_content("Unidade não pode ficar em brancoT")
  
  end

  it "is unsuccessful with no content" do
    visit edit_student_path(@student)

    fill_in "student_name", with: ""
    
    click_button "Editar"

    expect(page).to_not have_content("Estudante editado com sucesso")
    expect(page).to have_content("Erro ao editar o estudante")
    
    @student.reload
    expect(@student.name).to eq(@student.name)
  end

end