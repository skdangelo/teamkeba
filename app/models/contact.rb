class Contact < ApplicationRecord
  after_create :send_contact_email

  def send_contact_email
      NotificationMailer.contact_added(self).deliver_now
  end  
end
