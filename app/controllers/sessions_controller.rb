class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:danger] = "Email and/or Password is invalid, please try again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
