# Preview all emails at http://localhost:3000/rails/mailers/acceptance_mailer
class AcceptanceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/acceptance_mailer/received
  def received
    AcceptanceMailer.received
  end

  # Preview this email at http://localhost:3000/rails/mailers/acceptance_mailer/email
  def email
    AcceptanceMailer.email
  end

end
