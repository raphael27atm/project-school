require 'rails_helper'

describe "Deleting unit" do
  let(:user) { create(:user) }
  
  before(:each) do 
    sign_in_user(user)
    @unit = create(:unit)
  end

  it "is successful" do
    visit units_path

    within "#unit_#{@unit.id}" do
      find("#link_trash_#{@unit.id}").click
    end 

    expect(page).to have_content("Unidade foi deletada.")
    expect(Unit.count).to eq(0)
  end
end