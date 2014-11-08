class StaticPagesController < ApplicationController
  skip_before_filter :require_login

  def home
    @photos = Photo.on_main
  end

  def about
    @user = User.first
  end

  # def portfolio
  #   @photos = Photo.in_portfolio
  # end
end
