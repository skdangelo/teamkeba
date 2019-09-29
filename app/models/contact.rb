class Contact
  include ActiveModel::Model
  attr_accessor :name, :email, :subject, :message
  validates :name, :email, :subject, :message, presence: true

  def send_contact_email
      NotificationMailer.contact_added(self).deliver_now
  end  
end
