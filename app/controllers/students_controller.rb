class StudentsController < BaseController

  before_action :set_student, except: [:index, :new, :create]
  
  def index
    @students = Student.all.includes(:unit).order(id: :desc).paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @matriculations = Matriculation.where(student_id: params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = 'Estudante adicionado com sucesso'
      redirect_to action: :index
    else
      flash[:error] = "Foi encontrado os sequintes erros: #{@student.errors.full_messages }"
      render :new
    end
  end

  def edit
  end

  def update
    if @student.update_attributes(student_params)
      flash[:notice] = 'Estudante editado com sucesso'
      redirect_to action: :index
    else
      flash[:error] = 'Erro ao editar o estudante'
      render :edit
    end
  end

  def destroy
    if @student.destroy
      flash[:notice] = "O Estudante foi deletado."
    else
      flash[:error] = "Não foi possvel deletar o estudante."
    end
    redirect_to students_path
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(
      :name,
      :age,
      :phone,
      :unit_id
    )
  end

end