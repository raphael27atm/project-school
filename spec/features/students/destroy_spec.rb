require 'rails_helper' 

describe "Deleting unit" do
  let(:user) { create(:user) }
  let(:unit) { create(:unit, school_id: user.school_id) }

  before(:each) do 
    sign_in_user(user)
  end

  it "is successful" do
    @student = create(:student, unit_id: unit.id)
    visit students_path
    
    within dom_id_for(@student) do
      find("#link_trash_#{@student.id}").click
    end 

    expect(page).to have_content("Estudante foi deletado.")
  end
end