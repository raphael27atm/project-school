require 'rails_helper'

describe "Viewing teams" do
  let(:user) { create(:user) }
  let(:team) { create(:team) }
  
  before { sign_in_user(user) }

  it "List Teams" do
    visit teams_path
    teams = create_list(:team, 10)
    expect(page).to have_content "Turmas"
    expect(teams.count).to eq 10
  end  

  it "displays no items when a student is empty" do
    visit teams_path
    expect(page.all("table.todo_items tbody tr").size).to eq(0)
  end
  
end