class AcceptanceMailerJob
	include SuckerPunch::Job

  def perform(admission_id)
    ActiveRecord::Base.connection_pool.with_connection do
	    @admission = Admission.find(admission_id)
	    # @referrer = Referrer.find_by(referral_code: referrer)
	    AcceptanceMailer.email(@admission).deliver
	    # AcceptanceMailer.received(@fast_track_application).deliver
    end
  end
end