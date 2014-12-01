class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    reset_session
    session[:user_id] = user.id
    render :close_window
  end

  def destroy
    session[:user_id] = nil
    redirect_to :back, notice: "Signed out!"
  end
end
