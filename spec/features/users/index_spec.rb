require 'rails_helper'

describe "Viewing users" do
  let(:user) { create(:user) }

  before { sign_in_user(user) }

  it "List users" do
    users = create_list(:user, 10)
    visit users_path
    expect(page).to have_content "Usuários"
    expect(users.count).to eq 10
  end  

  it "displays no items when a user is empty" do
    visit users_path
    expect(page.all("table.todo_items tbody tr").size).to eq(0)
  end
  
end