class SessionsController < ApplicationController
  include ApplicationHelper
  skip_before_filter :authorize

  def new
    redirect_to profile_path if logged_in?
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
