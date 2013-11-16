class StaticPagesController < ApplicationController
  skip_before_filter :authorize

  def home
    @photo = Photo.where(main_photo: true).last || Photo.first
  end

  def about
    @user = User.last
  end

  def portfolio
    @photos = Photo.where(portfolio: true)
  end

  def contact
  end
end
