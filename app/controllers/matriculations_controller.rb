class MatriculationsController < BaseController

  before_action :set_team, except: [:destroy]
  before_action :set_matriculation, only: [:destroy]
  
  def new
    @matriculation = Matriculation.new
  end

  def create
    @matriculation = Matriculation.new(matriculation_params)
    @matriculation.team_id = @team.id
    if @matriculation.save
      flash[:notice] = 'Matricula realizada com sucesso'
      redirect_to team_path(@matriculation.team_id)
    else
      flash[:error] = "Foi encontrado os sequintes erros: #{@matriculation.errors.full_messages }"
      render :new
    end
  end


  def destroy
    if @matriculation.destroy
      flash[:notice] = "A Matricula foi deletada."
    else
      flash[:error] = "Não foi possvel deletar a matricula."
    end
    redirect_to teams_path
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_matriculation
    @matriculation = Matriculation.find(params[:id])
  end

  def matriculation_params
    params.require(:matriculation).permit(
      :number,
      :team_id,
      :student_id
    )
  end

end