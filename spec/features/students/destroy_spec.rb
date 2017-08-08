require 'rails_helper' 

describe "Deleting unit" do
  let(:user) { create(:user) }
  
  before(:each) do 
    sign_in_user(user)
    @student = create(:student)
  end

  it "is successful" do
    visit students_path
    
    within "tr#student_#{@student.id}" do
      find("#link_trash_#{@student.id}").click
    end 

    expect(page).to have_content("Estudante foi deletado.")
    expect(Student.count).to eq(0)
  end
end