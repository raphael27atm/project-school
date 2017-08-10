require 'rails_helper'

describe "Editing responsibles" do
  let(:user) { create(:user) }
  let(:student) { create(:student) }
  
  before(:each) do 
    sign_in_user(user)
    @responsible = create(:responsible, student_id: student.id)
  end 

  it "is successful with valid content" do
    visit responsibles_path
    
    within dom_id_for(@responsible) do
      find(".fa-edit").click
    end
    
    visit edit_responsible_path(@responsible)
    
    find("#responsible_name", "Nome Editado")
    find(:css, "select#responsible_student_id").set(@responsible.student_id)
   
    click_button "Editar"
  
    expect(page).to have_content("Responsável editado com sucesso")
  
  end

  it "is unsuccessful with no content" do
    visit edit_responsible_path(@responsible)

    fill_in "responsible_name", with: ""
    
    click_button "Editar"

    expect(page).to_not have_content("Resposǘel editado com sucesso")
    expect(page).to have_content("Erro ao editar o responsável")
    
    @responsible.reload
    expect(@responsible.name).to eq(@responsible.name)
  end

end