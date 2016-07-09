class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protected
  def authenticate_user
    if session[:admin_id]
      # set current user object to @current_user object variable
      @current_user = Admin.find session[:admin_id]
      return true
    else
      redirect_to(:controller => 'sessions', :action => 'login')
      return false
    end
  end

  def save_login_state
    if session[:admin_id]
      redirect_to(:controller => 'sessions', :action => 'home')
      return false
    else
      return true
    end
  end

  def authenticate_attendee
    if session[:atendee_id]
      # set current user object to @current_user object variable
      @current_attendee = Atendee.find session[:atendee_id]
      return true
    else
      redirect_to(:controller => 'sessions', :action => 'login_atendee')
      return false
    end
  end
end
