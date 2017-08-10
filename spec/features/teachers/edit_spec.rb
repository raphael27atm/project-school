require 'rails_helper'

describe "Editing teacher" do
  let(:user) { create(:user) }
  let(:unit) { create(:unit, school_id: user.school_id) }
  
  before(:each) do 
    sign_in_user(user)
    @teacher = create_list(:teacher, 5, unit_id: unit.id)
  end 

  it "is successful with valid content" do
    visit teachers_path
  
    within dom_id_for(@teacher.first) do
      find(".fa-edit").click
    end
    
    visit edit_teacher_path(@teacher.first)
    
    find("#teacher_name", "Nome Editado")
    find(:css, "select#teacher_unit_id").set(@teacher.first.unit_id)
   
    click_button "Editar"
  
    expect(page).to have_content("Professor foi atualizado com sucesso.")
  end

  it "is unsuccessful with no content" do
    visit edit_teacher_path(@teacher.first)

    fill_in "teacher_name", with: ""
    
    click_button "Editar"

    expect(page).to have_content("não pode ficar em branco")
    
    @teacher.first.reload
    expect(@teacher.first.name).to eq(@teacher.first.name)
  end

end