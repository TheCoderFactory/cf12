class EnquiryMailerJob
	include SuckerPunch::Job

  def perform(enquiry_id)
    ActiveRecord::Base.connection_pool.with_connection do
	    @enquiry = Enquiry.find(enquiry_id)
	    # @referrer = Referrer.find_by(referral_code: referrer)
	    EnquiryMailer.response(@enquiry).deliver
	    EnquiryMailer.received(@enquiry).deliver
    end
  end
end