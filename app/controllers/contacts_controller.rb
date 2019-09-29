class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    Contact.create(contact_params)
    redirect_to root_path
  end

  private

  def contact_params
    params.require(:contact).permit( :name, :email, :subject, :message)
  end
end
