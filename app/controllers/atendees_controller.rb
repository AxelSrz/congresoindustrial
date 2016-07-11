class AtendeesController < ApplicationController
  before_filter :authenticate_user, :only => [:new, :create, :lista_asistentes, :no_confirmados]
  before_filter :authenticate_attendee, :only => [:select_visit, :select_workshop, :associate_visit, :associate_workshop]

  def new
    @atendee = Atendee.new()
  end

  def create
    list_of_emails = atendee_params[:emails].split("\r\n")
    list_of_emails.each do |email|
      @atendee = Atendee.new(email: email, hora_asignada: params[:hora_asignada])
      if @atendee.save
        SendEmailJob.set(wait: 10.seconds).perform_later(@atendee)
      else
        flash[:notice] = "Form is invalid"
        flash[:color]= "invalid"
      end
    end
    render "create_attendees_success"
  end

  def create_attendees_success
  end

  def signup_atendee
    #Login Form
  end

  def select_visit
    if @current_attendee.hora_asignada < Time.zone.now
      @available_visits = Visit.available
      render "select_visit"
    else
      redirect_to '/inicio'
    end
  end

  def select_workshop
    if @current_attendee.hora_asignada < Time.zone.now
      @available_workshops = Workshop.available
      render "select_workshop"
    else
      redirect_to '/inicio'
    end
  end

  def associate_visit
    visit = Visit.find(params[:id])
    if visit.cupo_actual > 0 && !@current_attendee.visit && @current_attendee.hora_asignada < Time.zone.now
      @current_attendee.visit = visit
      visit.cupo_actual -= 1
      visit.asistentes_registrados += 1
      @current_attendee.save
      visit.save
      redirect_to '/inicio'
    else
      select_visit
    end
  end

  def associate_workshop
    workshop = Workshop.find(params[:id])
    if workshop.cupo_actual > 0 && !@current_attendee.workshop && @current_attendee.hora_asignada < Time.zone.now
      @current_attendee.workshop = workshop
      workshop.cupo_actual -= 1
      workshop.asistentes_registrados += 1
      @current_attendee.save
      workshop.save
      redirect_to '/inicio'
    else
      select_workshop
    end
  end

  def registro_atendee
    if params[:password] == params[:password_confirmation]
      Atendee.check_registration(atendee_registration_params)
    end
    redirect_to '/registro_exitoso'
  end

  def registration_success
  end

  def lista_asistentes
    @atendees = Atendee.confirmed
  end

  def no_confirmados
    @atendees = Atendee.not_confirmed
  end

  def logout
    session[:admin_id] = nil
    session[:atendee_id] = nil
    redirect_to :action => 'login_atendee'
  end

  private

  def atendee_params
    params.permit(:emails, :hora_asignada)
  end

  def atendee_registration_params
    params.permit(:nombre, :email, :password, :universidad, :registration_code)
  end
end
