class ContactFormController < ApplicationController

  # permit_all_parameters = true
  def route_admin
    AdminMailer.admin_email(email_params).deliver_now
  end

  private
  def email_params
    params.permit(:name, :email, :body)
  end
end
