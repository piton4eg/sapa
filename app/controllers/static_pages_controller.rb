class StaticPagesController < ApplicationController
  skip_before_filter :authorize

  def home
    @photo = Photo.where(main_photo: true).last || Photo.first
  end

  def about
    @user = User.first
  end

  def portfolio
    @photos = Photo.where(portfolio: true)
  end

  def contact
    @message = Message.new
  end

  def send_mail
    @message = Message.new(params[:message])
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Сообщение будет рассмотрено в ближайшее время, спасибо!")
    else
      flash.now.alert = "Необходимо заполнить все поля!"
      render :contact
    end
  end
end
