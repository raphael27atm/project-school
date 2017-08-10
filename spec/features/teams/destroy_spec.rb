require 'rails_helper'

describe "Deleting team" do
  let(:user) { create(:user) }
  let(:unit) { create(:unit, school_id: user.school_id) }

  before(:each) do 
    sign_in_user(user)
  end

  it "is successful" do
    @team = create(:team, unit_id: unit.id)
    visit teams_path

    within dom_id_for(@team) do
      find("#link_trash_#{@team.id}").click
    end 
 
    expect(page).to have_content("Turma foi deletada.")
  end
end