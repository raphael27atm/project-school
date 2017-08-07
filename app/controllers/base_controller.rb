class BaseController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!
  layout 'main'
end
