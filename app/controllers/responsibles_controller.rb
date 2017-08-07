class ResponsiblesController < BaseController

  before_action :set_responsible, except: [:index, :new, :create]
  
  def index
    @responsibles = Responsible.all.includes(:student).order(id: :desc).paginate(:page => params[:page], :per_page => 15)
  end

  def show
  end

  def new
    @responsible = Responsible.new
  end

  def create
    @responsible = Responsible.new(responsible_params)
    if @responsible.save
      flash[:notice] = 'Responsável adicionado com sucesso'
      redirect_to action: :index
    else
      flash[:error] = "Foi encontrado os sequintes erros: #{@responsible.errors.full_messages }"
      render :new
    end
  end

  def edit
  end

  def update
    if @responsible.update_attributes(responsible_params)
      flash[:notice] = 'Responsável editado com sucesso'
      redirect_to action: :index
    else
      flash[:error] = 'Erro ao editar o responsável'
      render :edit
    end
  end

  def destroy
    if @responsible.destroy
      flash[:notice] = "O responsável foi deletado."
    else
      flash[:error] = "Não foi possvel deletar o responsável."
    end
    redirect_to responsibles_path
  end

  private

  def set_responsible
    @responsible = Responsible.find(params[:id])
  end

  def responsible_params
    params.require(:responsible).permit(
      :name,
      :student_id
    )
  end

end