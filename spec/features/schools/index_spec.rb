require 'rails_helper'

describe "Viewing units" do
  let(:user) { create(:user) }
  let(:school) { create(:school) }
  
  before { sign_in_user(user) }

  it "List schools" do
    visit schools_path
    schools = create_list(:school, 10)
    expect(page).to have_content "Escolas"
    expect(schools.count).to eq 10
  end  

  it "displays no items when a unit is empty" do
    visit schools_path
    expect(page.all("table.todo_items tbody tr").size).to eq(0)
  end
  
end