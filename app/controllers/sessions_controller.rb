class SessionsController < ApplicationController
  include ApplicationHelper
  skip_before_filter :require_login, except: :destroy

  def new
    # redirect_to profile_path if logged_in?
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember_me])
      redirect_back_or_to root_url, notice: t('sessions.create.success')
    else
      flash.now[:error] = t('sessions.create.error')
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: t('sessions.destroy.success')
  end
end
