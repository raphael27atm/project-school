class UsersController < BaseController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :set_school_and_roles, execept: [:destroy, :create, :update]
  
  def index
    @users = current_school.users
      .order(id: :desc).paginate(:page => params[:page], :per_page => 5)
    respond_with(@users)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    respond_with(@user)
  end
  
  def edit
  end

  def update
    skip_password

    @user.update_attributes(user_params)
    respond_with(@user)
  end

  private

  def set_school_and_roles
    @schools = School.all.map{|s| [s.name, s.id] }
    @roles = Role.all.map{|s| [s.name, s.id] }
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :role_id,
      :school_id,
      :password,
      :password_confirmation
    )
  end

  def skip_password
    unless (params[:user][:password].present?)
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end

end
