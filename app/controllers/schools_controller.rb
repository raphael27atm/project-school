class SchoolsController < BaseController
  
  before_action :set_school, except: [:index, :new, :create]
  
  def index
    @schools = School.order(id: :desc)
      .paginate(:page => params[:page], :per_page => 5)
    respond_with(@schools)
  end

  def show
  end

  def new
    @school = School.new
  end

  def create
    @school = School.create(school_params)
    respond_with(@school)
  end

  def edit
  end

  def update
    @school.update_attributes(school_params)
    respond_with(@school)
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(
      :name,
      address_attributes: [
        :number,
        :state,
        :city,
        :schoo_id,
        :neighborhood,
        :complement,
        :street ]
    )
  end

end