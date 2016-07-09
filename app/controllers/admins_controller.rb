class AdminsController < ApplicationController
  before_filter :authenticate_user, :only => [:add_vow, :new, :create]

  def new
    @admin = Admin.new()
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "success"
  end

  def add_vow
  end

  def logout
    session[:admin_id] = nil
    session[:atendee_id] = nil
    redirect_to :action => 'login'
  end

  private

  def admin_params
    params.require(:admin).permit(:nombre, :email, :password, :password_confirmation)
  end
end
