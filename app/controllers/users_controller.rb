class UsersController < ApplicationController
  skip_before_filter :require_login,        only: %i(new create)
  before_action :redirect_if_user_present,  only: %i(new create)
  before_action :find_first_user,           only: %i(edit update)

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to profile_path, notice: t(:user_create_success)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: t(:user_edit_success)
    else
      render :edit
    end
  end

  #def destroy
  #  begin
  #    @user.destroy
  #    flash[:notice] = t(:user_delete_success)
  #  rescue Exception => e
  #    flash[:notice] = e.message
  #  end
  #  redirect_to root_path
  #end

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
