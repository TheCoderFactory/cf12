class FastTrackApplicationMailerJob
	include SuckerPunch::Job

  def perform(fast_track_application_id)
    ActiveRecord::Base.connection_pool.with_connection do
	    @fast_track_application = FastTrackApplication.find(fast_track_application_id)
	    # @referrer = Referrer.find_by(referral_code: referrer)
	    FastTrackApplicationMailer.response(@fast_track_application).deliver
	    FastTrackApplicationMailer.received(@fast_track_application).deliver
    end
  end
end