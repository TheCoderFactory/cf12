class RegistrationMailerJob
	include SuckerPunch::Job

  def perform(registration_id)
    ActiveRecord::Base.connection_pool.with_connection do
	    @registration = CourseRegistration.find(registration_id)
	    # @referrer = Referrer.find_by(referral_code: referrer)
	    RegistrationMailer.response(@registration).deliver
	    RegistrationMailer.received(@registration).deliver
    end
  end
end