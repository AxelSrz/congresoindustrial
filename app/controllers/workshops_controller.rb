class WorkshopsController < ApplicationController
  before_filter :authenticate_user, :only => [:new, :create, :success, :lista_talleres]
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

  private

  def workshop_params
    params.permit(:nombre, :descripcion, :empresa, :lugar, :fecha, :duracion, :cupo_maximo)
  end
end
