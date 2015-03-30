# Preview all emails at http://localhost:3000/rails/mailers/enrolment_mailer
class EnrolmentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/enrolment_mailer/received
  def received
    EnrolmentMailer.received
  end

end
