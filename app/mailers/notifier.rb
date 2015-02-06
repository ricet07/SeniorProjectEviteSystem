class Notifier < ActionMailer::Base
 default :from => "ricet07@gmail.com"   # Enter your email username here
         

  def welcome(user)
    @user = user
     mail(:to => "#{user.username} <#{user.email}>", :subject => "Registered")
  end 

  def invited(guest, event)
    @guest = guest
    @event = event

    	   mail(:to => "#{guest.id} <#{guest.email}>", :subject => "Invited")
  end 

  def sendNotification(guest, event)
  	@guest = guest
  	@event = event

  		mail(:to => "#{event.hostName} <#{event.hostEmail}>", :subject => "Notification")
  end
end
