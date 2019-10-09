class Enrollment < ApplicationRecord
  belongs_to :program
  belongs_to :user


  def paypal_url(return_path)
    values = {
        business: "skdangelo@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: id,
        amount: program.cost,
        item_name: program.title,
        item_number: program.id,
        quantity: '1'
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end  

  serialize :notification_params, Hash
  def paypal_url(return_path)
    values = {
        business: "skdangelo@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.configuration.app_host}#{return_path}",
        invoice: id,
        amount: program.cost,
        item_name: program.title,
        item_number: program.id,
        quantity: '1',
        notify_url: "#{Rails.configuration.app_host}/hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end
