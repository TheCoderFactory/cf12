class EnrolmentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.enrolment_mailer.received.subject
  #
  def received
    mail to: "workshops@thecoderfactory.com", from: "workshops@thecoderfactory.com", subject: "An enrolment has been received"
  end
end
