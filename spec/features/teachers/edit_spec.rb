require 'rails_helper'

describe "Editing teacher" do
  let(:user) { create(:user) }
  
  before(:each) do 
    sign_in_user(user)
    @teacher = create(:teacher)
  end

  it "is successful with valid content" do
    visit teachers_path
    
    within("#teacher_#{@teacher.id}") do
      find(".fa-edit").click
    end
    
    visit edit_teacher_path(@teacher)
    
    fill_in "teacher_name", with: "Nome Editado"
    find(:css, "select#teacher_unit_id").set(@teacher.unit_id)
    click_button "Editar"

    expect(page).to have_content("Erro ao editar o professor")
    
    @teacher.reload

    expect(@teacher.name).to eq("Nome Editado")
  end

  it "is unsuccessful with no content" do
    visit edit_teacher_path(@teacher)

    fill_in "teacher_name", with: ""
    
    click_button "Editar"

    expect(page).to_not have_content("Professor editado com sucesso")
    expect(page).to have_content("Erro ao editar o professor")
    
    @teacher.reload
    expect(@teacher.name).to eq(@teacher.name)
  end

end