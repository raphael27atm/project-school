require 'rails_helper'

describe "Deleting teacher" do
  let(:user) { create(:user) }
  
  before(:each) do 
    sign_in_user(user)
    @teacher = create(:teacher)
  end

  it "is successful" do
    visit teachers_path

    within "#teacher_#{@teacher.id}" do
      find("#link_trash_#{@teacher.id}").click
    end 

    expect(page).to have_content("Professor foi deletado.")
    expect(Teacher.count).to eq(0)
  end
end