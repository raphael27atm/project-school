require 'rails_helper'

describe "Editing temas" do
  let(:user) { create(:user) }
  let(:unit) { create(:unit) }
  
  before(:each) do 
    sign_in_user(user)
    @team = create(:team, unit_id: unit.id)
  end

  it "is successful with valid content" do
    visit teams_path
    
    within("#team_#{@team.id}") do
      find(".fa-edit").click
    end
    
    visit edit_team_path(@team)
    
    find("#team_name", "Nome Editado")
    find(:css, "select#team_unit_id").set(@team.unit_id)
   
    click_button "Editar"
  
    expect(page).to have_content("Erro ao editar turma")
  
  end

  it "is unsuccessful with no content" do
    visit edit_team_path(@team)

    fill_in "team_name", with: ""
    
    click_button "Editar"

    expect(page).to_not have_content("Turma editada com sucesso")
    expect(page).to have_content("Erro ao editar turma")
    
    @team.reload
    expect(@team.name).to eq(@team.name)
  end

end