class SessionsController < ApplicationController

  before_filter :authenticate_user, :only => [:index, :home, :profile, :setting, :herramientas]
  before_filter :authenticate_attendee, :only => [:attendee_home]
  before_filter :save_login_state, :only => [:login, :login_attempt]

  def login
    #Login Form
  end

  def login_atendee
    #Login Form
  end

  def login_attempt
    authorized_user = Admin.authenticate(params[:email],params[:login_password])
    if authorized_user
      session[:admin_id] = authorized_user.id
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.nombre}"
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"
    end
  end

  def login_attempt_atendee
    authorized_user = Atendee.authenticate(params[:email],params[:login_password])
    if authorized_user
      session[:atendee_id] = authorized_user.id
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.nombre}"
      redirect_to(:action => 'attendee_home')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login_atendee"
    end
  end

  def logout
    session[:admin_id] = nil
    session[:atendee_id] = nil
		redirect_to :action => 'login'
	end

  def home
  end

  def attendee_home
  end

  def profile
  end

  def setting
  end

  def herramientas
  end

end
