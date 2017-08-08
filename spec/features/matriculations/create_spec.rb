require 'rails_helper'

describe "Adding matriculation" do
  let(:user) { create(:user) }
  let(:team) { create(:team) }
  let(:student) { create(:student) }
  let(:matriculation) { create(:matriculation) }

  before(:each) do 
    sign_in_user(user)
  end

  it "is successful with valid content" do
    
    visit team_path(matriculation.team_id)
    click_link "Matricular estudantes"
    fill_in "matriculation_number", with: "123456"
    find("#matriculation_student_id", student.id)
    click_button "Realizar Matricula"
    
    expect(page).to have_content(matriculation.id)
  end

  it "displays an error with no content" do
    visit team_path(matriculation.team_id)
    click_link "Matricular estudantes"
    fill_in "matriculation_number", with: ""
    find("#matriculation_student_id", "")
    click_button "Realizar Matricula"
    within("div.alert") do
      expect(page).to have_content("Foi encontrado os sequintes erros: [\"Unit é obrigatório(a)\", \"Unit não pode ficar em branco\"]")
    end
  end

end