class Api::V1::AuthController < Api::V1::BaseController
  before_action :set_user
  
  def create
    if @user.valid_password?(params[:password])
      render json: {
        user: UserSerializer.new(@user),
        authorized: "true"
      }, status: :ok
    else
      render json: {
        error: I18n.translate('devise.failure.user.invalid'),
        authorized: "false"
      }, status: :bad_request
    end
  end

  private
  
  def set_user
    @user = User.find_by_email(params[:email])
    render json: {error: I18n.translate('devise.failure.user.invalid'), authorized: "false"}, status: :not_found unless @user
  end
  
end
