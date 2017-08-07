class TeachersController < BaseController
  
  before_action :set_teacher, except: [:index, :new, :create]
  
  def index
    @teachers = Teacher.all.includes(:unit).order(id: :desc).paginate(:page => params[:page], :per_page => 15)
  end

  def show
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:notice] = 'Professor adicionado com sucesso'
      redirect_to action: :index
    else
      flash[:error] = "Foi encontrado os sequintes erros: #{@teacher.errors.full_messages }"
      render :new
    end
  end

  def edit
  end

  def update
    if @teacher.update_attributes(teacher_params)
      flash[:notice] = 'Professor editado com sucesso'
      redirect_to action: :index
    else
      flash[:error] = 'Erro ao editar o professor'
      render :edit
    end
  end

  def destroy
    if @teacher.destroy
      flash[:notice] = "Professor foi deletado."
    else
      flash[:error] = "Não foi possvel deletar o professor."
    end
    redirect_to teachers_path
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(
      :name,
      :unit_id
     )
  end

end