class VisitsController < ApplicationController
  before_filter :authenticate_user, :only => [:new, :create, :success, :lista_visitas, :detalle_visita, :abrir_lugares_visitas]
  def new
    @visit = Visit.new()
  end

  def create
    @visit = Visit.new(visit_params)
    @visit.cupo_actual = 0
    @visit.asistentes_registrados = 0
    unless @visit.save
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "success"
  end

  def success
  end

  def lista_visitas
    @visits = Visit.all
  end

  def detalle_visita
    @visit = Visit.find(params[:id])
  end

  def abrir_lugares_visitas
    @visit = Visit.find(params[:id])
    @visit.cupo_actual += params[:cantidad].to_i
    @visit.save
    render "detalle_visita"
  end

  private

  def visit_params
    params.permit(:nombre, :descripcion, :empresa, :lugar, :fecha, :duracion, :cupo_maximo)
  end
end
