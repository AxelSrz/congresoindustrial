class AtendeesController < ApplicationController
  def new
    @atendee = Atendee.new
  end
  def create
    @atendee = Atendee.new(params[:atendee])
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "new"
  end
end
