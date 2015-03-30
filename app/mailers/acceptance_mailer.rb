class AcceptanceMailer < ApplicationMailer
  default from: "Coder Factory Application <info@thecoderfactory.com>"

  def email(admission)
    @admission = admission
    @fast_track_application = @admission.fast_track_application
    mail(to: @fast_track_application.email, subject: @fast_track_application.first_name + ", you have been accepted into Fast Track!")
  end

  def received(admission)
    @admission = admission
    mail(to: "info@thecoderfactory.com", subject: "Fast Track Admission Received")
  end
end
