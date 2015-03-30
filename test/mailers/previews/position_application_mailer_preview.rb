# Preview all emails at http://localhost:3000/rails/mailers/position_application_mailer
class PositionApplicationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/position_application_mailer/response
  def response
    PositionApplicationMailer.response
  end

  # Preview this email at http://localhost:3000/rails/mailers/position_application_mailer/received
  def received
    PositionApplicationMailer.received
  end

end
