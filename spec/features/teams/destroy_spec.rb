require 'rails_helper'

describe "Deleting team" do
  let(:user) { create(:user) }
  
  before(:each) do 
    sign_in_user(user)
    @team = create(:team)
  end

  it "is successful" do
    visit teams_path

    within "#team_#{@team.id}" do
      find("#link_trash_#{@team.id}").click
    end 

    expect(page).to have_content("Turma foi deletada.")
    expect(Team.count).to eq(0)
  end
end