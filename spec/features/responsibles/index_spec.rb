require 'rails_helper'

describe "Viewing units" do
  let(:user) { create(:user) }
  let(:unit) { create(:unit) }
  
  before { sign_in_user(user) }

  it "List responsibles" do
    visit responsibles_path
    responsibles = create_list(:responsible, 10)
    expect(page).to have_content "Responsáveis"
    expect(responsibles.count).to eq 10
  end  

  it "displays no items when a responsibles is empty" do
    visit responsibles_path
    expect(page.all("table.todo_items tbody tr").size).to eq(0)
  end
  
end