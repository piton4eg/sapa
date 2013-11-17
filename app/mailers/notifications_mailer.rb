class NotificationsMailer < ActionMailer::Base 
  default :from => "noreply@markovaolga.ru"
  default :to => "sapa327@mail.com"
 
  def new_message(message)
    @message = message
    mail(:subject => "#{message.subject}")
  end
 
end
