module ApplicationHelper
  
  def menu_active_for(type, action = nil)
    active_in_controller = ["admin/#{type}"].include? params[:controller]
    if action.nil?
      active_in_controller ? "active open" : ''
    else
      if action.is_a? Array
        active_in_action = action.map(&:to_s).include? params[:action]
      else
        active_in_action = (params[:action] == action.to_s)
      end
      (active_in_controller && active_in_action) ? "active open" : ''
    end
  end

end
