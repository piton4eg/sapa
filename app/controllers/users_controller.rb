class UsersController < ApplicationController
  skip_before_filter :require_login,        only: %i(new create)
  # todo: fix it
  # before_action :redirect_if_user_present,  only: %i(new create)
  before_action :find_first_user,           only: %i(edit update)

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to root_path, notice: t('users.create.success')
    else
      flash.now[:error] = t('users.create.error')
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: t('users.update.success')
    else
      flash.now[:error] = t('users.update.error')
      render :edit
    end
  end

  private

  def find_first_user
    @user = User.first
  end

  def redirect_if_user_present
    redirect_to profile_path unless User.count.zero?
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
      :info, :avatar, :avatar_cache, :remote_avatar_url, :remove_avatar)
  end
end
