class TeamsController < BaseController

  before_action :set_team, except: [:index, :new, :create, :matriculations]
  
  def index
    @teams = Team.select_data(current_school.id)
      .order(id: :desc).paginate(:page => params[:page], :per_page => 5)
    respond_with(@teams)
  end

  def show
    @matriculations = Matriculation.where(team_id: params[:id])
      .order(id: :desc).paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params)
    respond_with(@team)
  end

  def edit
  end

  def update
    @team.update_attributes(team_params)
    respond_with(@team)
  end

  def destroy
    @team.destroy
    respond_with(@team)
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