module ApplicationHelper
  
  def menu_active_for(type)
    active_in_controller = ["#{type}"].include? params[:controller]
    active_in_controller ? "active-link open" : ''
  end

  def school_in(school)
      session[:school_id] = school
  end

  def current_school
      @current_school ||= School.find_by(id: session[:school_id])
  end


end
