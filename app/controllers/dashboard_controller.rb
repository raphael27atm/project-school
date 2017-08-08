class DashboardController < BaseController
  before_action :session_school
  
  def index
    @analytics = School.where(id: current_school.id)
      .includes(units: [{students: :responsibles}, :teachers, :teams])
  end

  def session_school
    school_in current_user.school_id
  end
    
end
