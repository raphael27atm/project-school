require 'rails_helper'

describe "Adding matriculation" do
  let(:user) { create(:user) }
  let(:team) { create(:team) }
  let(:student) { create(:student) }
  let(:matriculation) { create(:matriculation) }

  before(:each) do 
    sign_in_user(user)
    @student = create(:student)
    @team = create(:team)
  end

  it "is successful with valid content" do
    visit new_team_matriculation_path(@team)
    
    fill_in "matriculation_number", with: "123456"
    find("#matriculation_student_id", @student.id )
    click_button "Realizar Matricula" 
    
    expect(page).to have_content("Criar Matricula")
  end

  it "displays an error with no content" do
    visit new_team_matriculation_path(team)
    fill_in "matriculation_number", with: ""
    find("#matriculation_student_id", "")
    click_button "Realizar Matricula"
    within("div.alert") do
      expect(page).to have_content("Foi encontrado os sequintes erros: [\"Student é obrigatório(a)\"")
    end
  end

end