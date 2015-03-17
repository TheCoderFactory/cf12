class LocationsController < ApplicationController
  def index
  	@locations = Shoppe::Location.all
  end

  def show
  	@locations = Shoppe::Location.all
  	@location = Shoppe::Location.find_by(city: params[:city])
  end
end
