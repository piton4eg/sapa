class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to login_url, alert: t(:unknown_authorize)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
