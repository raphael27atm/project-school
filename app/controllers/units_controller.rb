class UnitsController < BaseController
  before_action :set_unit, except: [:index, :new, :create]
  def index
    @units = Unit.all.includes(:students, :teams).paginate(:page => params[:page], :per_page => 15)
  end

  def show
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(unit_params)
    @unit.school_id = current_user.school_id if current_user.role.name == "moderator"
    if @unit.save
      flash[:notice] = 'Unidade criada com sucesso'
      redirect_to action: :index
    else
      flash[:error] = "Foi encontrado os sequintes erros: #{@unit.errors.full_messages }"
      render :new
    end
  end

  def edit
  end

  def update
    if @unit.update_attributes(unit_params)
      flash[:notice] = 'Unidade editada com sucesso'
      redirect_to action: :index
    else
      flash[:error] = 'Erro ao editar a unidade'
      render :show
    end
  end

  def destroy
    if @unit.destroy
      flash[:notice] = "Unidade foi deletada."
    else
      flash[:error] = "Não foi possvel deletar essa unidade."
    end
    redirect_to units_path
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
    )
  end

end