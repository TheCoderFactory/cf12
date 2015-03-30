json.array!(@admissions) do |admission|
  json.extract! admission, :id, :fast_track_application_id, :name, :email, :phone, :street_address, :city, :postcode, :state, :country, :programme, :scholarship, :laptop, :payment_plan, :accommodation, :agreement
  json.url admission_url(admission, format: :json)
end
