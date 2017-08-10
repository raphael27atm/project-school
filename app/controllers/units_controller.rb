class UnitsController < BaseController
  
  before_action :set_unit, except: [:index, :new, :create]
  
  def index
    @units = current_school.units
      .includes(:students, :teams)
      .order(id: :desc).paginate(:page => params[:page], :per_page => 5)
    respond_with(@units)
  end

  def show
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.create(unit_params)
    respond_with(@unit)
  end

  def edit
  end

  def update
    @unit.update_attributes(unit_params)
    respond_with(@unit)
  end

  def destroy
    @unit.destroy
    respond_with(@unit)
  end

  private

  def set_unit
    @unit = Unit.find(params[:id])
  end

  def unit_params
    params.require(:unit).permit(
      :name,
      address_attributes: [
        :number,
        :state,
        :city,
        :schoo_id,
        :neighborhood,
        :complement,
        :street ]
    ).merge(school_id: current_user.school_id)
  end

end