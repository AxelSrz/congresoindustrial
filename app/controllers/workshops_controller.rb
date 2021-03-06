class WorkshopsController < ApplicationController
  before_filter :authenticate_user, :only => [:new, :create, :success, :lista_talleres, :detalle_taller, :abrir_lugares_talleres]
  def new
    @workshop = Workshop.new()
  end

  def create
    @workshop = Workshop.new(workshop_params)
    @workshop.cupo_actual = 0
    @workshop.asistentes_registrados = 0
    unless @workshop.save
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "success"
  end

  def success
  end

  def lista_talleres
    @workshops = Workshop.all
  end

  def detalle_taller
    @workshop = Workshop.find(params[:id])
  end

  def abrir_lugares_talleres
    @workshop = Workshop.find(params[:id])
    @workshop.cupo_actual += params[:cantidad].to_i
    @workshop.lugar = params[:lugar]
    @workshop.save
    render "detalle_taller"
  end

  private

  def workshop_params
    params.permit(:representante, :tipo, :descripcion, :empresa, :lugar, :fecha, :duracion, :cupo_maximo)
  end
end
