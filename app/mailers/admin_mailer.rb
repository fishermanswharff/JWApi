class AdminMailer < ActionMailer::Base

  default to: 'fishermanswharff@mac.com'

  def admin_email(params)
    @params = params
    mail(
        content_type: "text/html",
        subject: "Sent from JW dot com",
        template_path: 'admin_mailer'
        )
  end
end