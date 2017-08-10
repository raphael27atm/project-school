require 'rails_helper'

describe "Deleting teacher" do
  let(:user) { create(:user) }
  let(:unit) { create(:unit, school_id: user.school_id) }

  before(:each) do 
    sign_in_user(user)
  end

  it "is successful" do
    @teacher = create(:teacher, unit_id: unit.id)
    visit teachers_path

    within dom_id_for(@teacher) do
      find("#link_trash_#{@teacher.id}").click
    end 

    expect(page).to have_content("Professor foi removido com sucesso.")
  end
end