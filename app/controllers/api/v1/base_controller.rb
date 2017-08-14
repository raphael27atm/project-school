class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :authenticate_user_from_token!
  before_action :verify_secret_key!
  
  private

  def authenticate_user_from_token!
    user_token = params[:auth_token].presence
    user = user_token && User.find_by_auth_token(user_token.to_s)
    if user
      params.delete :auth_token
      sign_in user, store: false
    end
  end

  def verify_secret_key!
    if (params[:api_key] != SchoolProject::Application.config.secret_api_key)
      invalid_authentication
    end
    params.delete :api_key
  end

  def invalid_authentication
    render json: {error: t('devise.failure.unauthenticated')}, status: :unauthorized
  end

end
