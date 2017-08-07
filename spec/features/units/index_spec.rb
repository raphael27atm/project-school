require 'rails_helper'

describe "Viewing units" do
  let(:user) { create(:user) }
  let(:unit) { create(:unit) }
  
  before { sign_in_user(user) }

  it "List units" do
    visit units_path
    units = create_list(:unit, 10)
    expect(page).to have_content "Unidades"
    expect(units.count).to eq 10
  end  

  it "displays no items when a unit is empty" do
    visit units_path
    expect(page.all("table.todo_items tbody tr").size).to eq(0)
  end
  
end