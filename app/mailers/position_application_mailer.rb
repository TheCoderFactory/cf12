class PositionApplicationMailer < ApplicationMailer
  default from: "Coder Factory Application <info@thecoderfactory.com>"

  def response(position_application)
    @position_application = position_application
    mail(to: @position_application.email, subject: @position_application.name + ", your Coder Factory application has been received")
  end

  def received(position_application)
    @position_application = position_application
    mail(to: "info@thecoderfactory.com", subject: "Position Application Received")
  end
end
