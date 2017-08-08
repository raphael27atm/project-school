class UsersController < BaseController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = current_school.users
      .order(id: :desc).paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @schools = School.all.map{|s| [s.name, s.id] }
    @roles = Role.all.map{|s| [s.name, s.id] }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Usuário adicionado com sucesso'
      redirect_to action: :index
    else
      flash[:error] = "Foi encontrado os sequintes erros: #{@user.errors.full_messages }"
      render :new
    end
  end
  
  def edit
    @schools = School.all.map{|s| [s.name, s.id] }
    @roles = Role.all.map{|s| [s.name, s.id] }
  end

  def update

    skip_password

    if @user.update_attributes(user_params)
      flash[:notice] = 'Usuário editado com sucesso'
      redirect_to action: :index
    else
      flash[:error] = 'Erro ao editar usuário'
      render :edit
    end
  end

  private

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
