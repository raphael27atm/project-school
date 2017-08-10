require 'rails_helper'

describe "Adding students" do
  let(:user) { create(:user) }
  let(:student) { create(:student) }
  let(:school) { create(:school) }
  let(:unit) { create(:unit, school_id: school.id) }

  before(:each) do 
    sign_in_user(user)
  end

  it "is successful with valid content" do
    
    visit students_path
    click_link "Adicionar novo estudante"
    fill_in "student_name", with: unit.name
    find("#student_unit_id", unit.id)
    fill_in "student_age", with: student.age
    fill_in "student_phone", with: student.phone
    click_button "Salvar"
    
    expect(page).to have_content("Estudantes")
  end

  it "displays an error with no content" do
    visit students_path
    click_link "Adicionar novo estudante"
    fill_in "student_name", with: unit.name
    find("#student_unit_id", unit.id)
    fill_in "student_age", with: student.age
    fill_in "student_phone", with: student.phone
    click_button "Salvar"
  
    within(".help-block") do
      expect(page).to have_content("não pode ficar em branco")
    end
  end

end