require 'rails_helper'

describe "Deleting team" do
  let(:user) { create(:user) }
  
  before(:each) do 
    sign_in_user(user)
    @matriculation = create(:matriculation)
  end

  it "is successful" do
    visit team_path(@matriculation.team_id)

    within "#matriculation_#{@matriculation.id}" do
      find("#link_trash_#{@matriculation.id}").click
    end

    expect(page).to have_content("A Matricula foi deletada.")
    expect(Matriculation.count).to eq(0)
  end
end