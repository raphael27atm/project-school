module ApplicationHelper
  
  def menu_active_for(type)
    active_in_controller = ["#{type}"].include? params[:controller]
    active_in_controller ? "active-link open" : ''
  end

end
