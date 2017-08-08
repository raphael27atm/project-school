class SchoolsController < BaseController
  
  before_action :set_school, except: [:index, :new, :create]
  
  def index
    @schools = School.order(id: :desc)
      .paginate(:page => params[:page], :per_page => 5)
  end

  def show
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      flash[:notice] = 'Escola criada com sucesso'
      redirect_to action: :index
    else
      flash[:error] = "Foi encontrado os sequintes erros: #{@school.errors.full_messages }"
      render :new
    end
  end

  def edit
  end

  def update
    if @school.update_attributes(school_params)
      flash[:notice] = 'Escola editada com sucesso'
      redirect_to action: :index
    else
      flash[:error] = 'Erro ao editar escola'
      render :edit
    end
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