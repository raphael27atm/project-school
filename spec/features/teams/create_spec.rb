require 'rails_helper'

describe "Adding teams" do
  let(:user) { create(:user) }
  let(:team) { create(:team) }
  let(:school) { create(:school) }
  let(:unit) { create(:unit, school_id: school.id) }

  before(:each) do 
    sign_in_user(user)
  end

  it "is successful with valid content" do
    
    visit teams_path
    click_link "Adicionar nova turma"
    fill_in "team_name", with: unit.name
    find("#team_unit_id", unit.id)
    click_button "Salvar"
    
    expect(page).to have_content("Turmas")
  end

  it "displays an error with no content" do
    visit teams_path
    click_link "Adicionar nova turma"
    fill_in "team_name", with: unit.name
    find("#team_unit_id", unit.id)
    click_button "Salvar"
    
    within(".help-block") do
      expect(page).to have_content("não pode ficar em branco")
    end
  end

end