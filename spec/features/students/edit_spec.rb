require 'rails_helper'

describe "Editing students" do
  let(:user) { create(:user) }
  
  before(:each) do 
    sign_in_user(user)
    unit = create(:unit, school_id: user.school_id)
    @student = create_list(:student, 5, unit_id: unit.id)
  end

  it "is successful with valid content" do
    visit students_path 
  
    within dom_id_for(@student.first) do
      find(".fa-edit").click
    end
    
    visit edit_student_path(@student.first)
    
    find("#student_name", "Nome Editado")
    find(:css, "select#student_unit_id").set(@student.first.unit_id)
   
    click_button "Editar"
  
    expect(page).to have_content("Estudante editado com sucesso")
  
  end

  it "is unsuccessful with no content" do
    visit edit_student_path(@student.first)

    fill_in "student_name", with: ""
    
    click_button "Editar"

    expect(page).to_not have_content("Estudante editado com sucesso")
    expect(page).to have_content("Erro ao editar o estudante")
    
    @student.first.reload
    expect(@student.first.name).to eq(@student.first.name)
  end

end