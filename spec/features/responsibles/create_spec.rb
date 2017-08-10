require 'rails_helper'

describe "Adding responsible" do
  let(:user) { create(:user) }
  let(:responsible) { create(:responsible) }
  let(:student) { create(:student) }

  before(:each) do 
    sign_in_user(user)
  end

  it "is successful with valid content" do
    visit responsibles_path
    click_link "Adicionar novo resposável"
    fill_in "responsible_name", with: responsible.name
    find("#responsible_student_id", student.id)
    click_button "Salvar"
    
    expect(page).to have_content("Responsáveis")
  end

  it "displays an error with no content" do
    visit responsibles_path
    click_link "Adicionar novo resposável"
    fill_in "responsible_name", with: responsible.name
    find("#responsible_student_id", student.id)
    click_button "Salvar"
    
    within(".help-block") do
      expect(page).to have_content("não pode ficar em branco")
    end
  end

end