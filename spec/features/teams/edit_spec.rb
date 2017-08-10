require 'rails_helper'

describe "Editing teams" do
  let(:user) { create(:user) }
  let(:unit) { create(:unit, school_id: user.school_id) }

  before(:each) do 
    sign_in_user(user)  
    @team = create_list(:team, 5, unit_id: unit.id)
  end 

  it "is successful with valid content" do
    visit teams_path
  
    within dom_id_for(@team.first) do
      find(".fa-edit").click
    end
    
    visit edit_team_path(@team.first)
    
    find("#team_name", "Nome Editado")
    find(:css, "select#team_unit_id").set(@team.first.unit_id)
   
    click_button "Editar"
  
    expect(page).to have_content("Turma editada com sucesso")
  
  end

  it "is unsuccessful with no content" do
    visit edit_team_path(@team.first)

    fill_in "team_name", with: ""
    
    click_button "Editar"

    expect(page).to_not have_content("Turma editada com sucesso")
    expect(page).to have_content("Erro ao editar turma")
    
    @team.first.reload
    expect(@team.first.name).to eq(@team.first.name)
  end

end