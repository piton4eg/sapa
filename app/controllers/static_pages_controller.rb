class StaticPagesController < ApplicationController
  skip_before_filter :authorize

  def home
    # @photo = Photo.on_main.last || Photo.first
    @photos = Photo.on_main
  end

  def about
    @user = User.first
  end

  # def portfolio
  #   @photos = Photo.in_portfolio
  # end
end
