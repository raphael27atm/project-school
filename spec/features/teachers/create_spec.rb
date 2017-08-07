require 'rails_helper'

describe "Adding units" do
  let(:user) { create(:user) }
  let(:unit) { create(:unit) }
  let(:teacher) { create(:teacher) }
  
  before(:each) do 
    sign_in_user(user)
  end

  it "is successful with valid content" do
    visit teachers_path
    click_link "Adicionar novo professor"
    fill_in "teacher_name", with: teacher.name
    find("#teacher_unit_id", unit.id)
    click_button "Salvar"

    expect(page).to have_content("Professores")
  end

  it "displays an error with no content" do
    visit teachers_path
    click_link "Adicionar novo professor"
    fill_in "teacher_name", with: ""
    click_button "Salvar"
    within("div.alert") do
      expect(page).to have_content("Foi encontrado os sequintes erros: [\"Unit é obrigatório(a)\"")
    end
  end

end