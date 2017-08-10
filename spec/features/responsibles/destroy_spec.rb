require 'rails_helper'

describe "Deleting responsible" do
  let(:user) { create(:user) }
  let(:student) { create(:student) }
 
  before(:each) do 
    sign_in_user(user)
  end

  it "is successful" do
    @responsible = create(:responsible, student_id: student.id)
    visit responsibles_path
  
    within dom_id_for(@responsible) do
      find("#link_trash_#{@responsible.id}").click
    end  
    
    expect(page).to have_content("O responsável foi deletado.")
  end
end