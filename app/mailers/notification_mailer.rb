class NotificationMailer < ApplicationMailer
  default from: "no-reply@teamkeba.com"

  def contact_added(contact)
    mail(to: "skdangelo@gmail.com",
         subject: "Team Keba Email from #{contact.name}")   
  end
end
