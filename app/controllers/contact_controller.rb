class ContactController < ApplicationController
	skip_before_action :authenticate_user!
  def index
  	@enquiry = Enquiry.new
  end
end
