class PositionApplicationMailerJob
	include SuckerPunch::Job

  def perform(position_application_id)
    ActiveRecord::Base.connection_pool.with_connection do
	    @position_application = PositionApplication.find(position_application_id)
	    # @referrer = Referrer.find_by(referral_code: referrer)
	    PositionApplicationMailer.response(@position_application).deliver
	    PositionApplicationMailer.received(@position_application).deliver
    end
  end
end