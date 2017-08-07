require 'rails_helper'

describe "Viewing units" do
  let(:user) { create(:user) }
  let(:student) { create(:student) }
  
  before { sign_in_user(user) }

  it "List Students" do
    visit students_path
    students = create_list(:unit, 10)
    expect(page).to have_content "Estudantes"
    expect(students.count).to eq 10
  end  

  it "displays no items when a student is empty" do
    visit students_path
    expect(page.all("table.todo_items tbody tr").size).to eq(0)
  end
  
end