require 'rails_helper'

describe "Viewing teachers" do
  let(:user) { create(:user) }
  let(:teacher) { create(:teacher) }
  
  before { sign_in_user(user) }

  it "List teachers" do
    visit teachers_path
    teachers = create_list(:unit, 10)
    expect(page).to have_content "Professores"
    expect(teachers.count).to eq 10
  end  

  it "displays no items when a teacher is empty" do
    visit teachers_path
    expect(page.all("table.todo_items tbody tr").size).to eq(0)
  end
  
end