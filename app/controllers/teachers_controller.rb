class TeachersController < BaseController
  
  before_action :set_teacher, except: [:index, :new, :create]
  
  def index
    @teachers = Teacher.select_data(current_school.id)
      .order(id: :desc).paginate(:page => params[:page], :per_page => 5)
    respond_with(@teachers)
  end

  def show
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.create(teacher_params)
    respond_with(@teacher)
  end

  def edit
  end

  def update
    @teacher.update_attributes(teacher_params)
    respond_with(@teacher)
  end

  def destroy
    @teacher.destroy
    respond_with(@teacher)
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