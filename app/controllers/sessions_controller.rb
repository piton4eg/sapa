class SessionsController < ApplicationController
  include ApplicationHelper
  skip_before_filter :require_login, except: :destroy

  def new
    # redirect_to profile_path if logged_in?
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember_me])
      redirect_back_or_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = t(:unknown_authorize)
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: "Logged out!"
  end
end
