class NotificationsMailer < ActionMailer::Base
  default from: "from@example.com"
 
  default :from => "noreply@markovaolga.ru"
  default :to => "markova.antonova@gmail.com"
 
  def new_message(message)
    @message = message
    mail(:subject => "#{message.subject}")
  end
 
end
