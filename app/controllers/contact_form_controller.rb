class ContactFormController < ApplicationController

  def route_admin
    AdminMailer.admin_email(params).deliver_now
  end
end