class DashboardController < BaseController
  before_action :session_school
  def index
  end

  def session_school
    school_in current_user.school_id
  end
    
end
