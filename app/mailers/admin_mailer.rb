class AdminMailer < ActionMailer::Base

  attr_accessor :name, :email, :body, :params

  def admin_email(params)
    @name = params['name']
    @email = params['email']
    @body = params['body']
    mail(
        to: 'fishermanswharff@mac.com',
        content_type: "text/html",
        subject: "Sent from JW dot com",
        template_path: 'admin_mailer',
        date: Time.now
        ).deliver
  end
end

# curl -i -X POST -d '[name]=jason&[email]=fishermanswharff@mac.com&[body]=Some text goes here' http://localhost:3000/email/admin