class ResponsiblesController < BaseController

  before_action :set_responsible, except: [:index, :new, :create]
  
  def index
    @responsibles = Responsible.all
      .includes(:student).order(id: :desc)
      .paginate(:page => params[:page], :per_page => 5)
    respond_with(@responsibles)
  end

  def show
  end

  def new
    @responsible = Responsible.new
  end

  def create
    @responsible = Responsible.create(responsible_params)
    respond_with(@responsible, location: responsibles_path)
  end

  def edit
    respond_with(@responsible)
  end

  def update
    @responsible.update_attributes(responsible_params)
    respond_with(@responsible, location: responsibles_path)
  end

  def destroy
    @responsible.destroy
    respond_with(@responsible) 
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