json.array!(@position_applications) do |position_application|
  json.extract! position_application, :id, :name, :phone, :email, :linkedin, :github, :experience, :reason, :special, :position
  json.url position_application_url(position_application, format: :json)
end
