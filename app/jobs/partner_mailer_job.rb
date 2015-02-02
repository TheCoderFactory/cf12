class PartnerMailerJob
	include SuckerPunch::Job

  def perform(partner_id)
    ActiveRecord::Base.connection_pool.with_connection do
	    @partner = Partner.find(partner_id)
	    # @referrer = Referrer.find_by(referral_code: referrer)
	    PartnerMailer.response(@partner).deliver
	    PartnerMailer.received(@partner).deliver
    end
  end
end