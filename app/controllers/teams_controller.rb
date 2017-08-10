class TeamsController < BaseController

  before_action :set_team, except: [:index, :new, :create, :matriculations]
  
  def index
    @teams = Team.select_data(current_school.id)
      .order(id: :desc).paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @matriculations = Matriculation.where(team_id: params[:id])
      .order(id: :desc).paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:notice] = 'Turma adicionada com sucesso'
      redirect_to action: :index
    else
      flash[:error] = "Foi encontrado os sequintes erros: #{@team.errors.full_messages }"
      render :new
    end
  end

  def edit
  end

  def update
    if @team.update_attributes(team_params)
      flash[:notice] = 'Turma editada com sucesso'
      redirect_to action: :index
    else
      flash[:error] = 'Erro ao editar turma'
      render :edit
    end
  end

  def destroy
    if @team.destroy
      flash[:notice] = "A Turma foi deletada."
    else
      flash[:error] = "Não foi possvel deletar a turma."
    end
    redirect_to teams_path
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(
      :name,
      :unit_id
    )
  end

  def matriculation_params
    params.require(:matriculation).permit(
      :number,
      :team_id,
      :student_id
    )
  end

end