class StudentsController < BaseController

  before_action :set_student, except: [:index, :new, :create]
  
  def index
    @students = Student.select_data(current_school.id)
      .order(id: :desc).paginate(:page => params[:page], :per_page => 5)
    respond_with(@students)
  end

  def show
    @matriculations = Matriculation.where(student_id: params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    respond_with(@student)
  end

  def edit
  end

  def update
    @student.update_attributes(student_params)
    respond_with(@student)
  end

  def destroy
    @student.destroy
    respond_with(@student, :location => students_path)
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