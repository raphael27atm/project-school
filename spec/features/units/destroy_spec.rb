require 'rails_helper'

describe "Deleting unit" do
  let(:user) { create(:user) }
   
  before(:each) do 
    sign_in_user(user)
  end

  it "is successful" do
    @unit = create(:unit, school_id: user.school_id)
    visit units_path

    within dom_id_for(@unit) do
      find("#link_trash_#{@unit.id}").click
    end 

    expect(page).to have_content("Unidade foi removido com sucesso")
  end
end