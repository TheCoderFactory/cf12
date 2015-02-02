json.array!(@scholarships) do |scholarship|
  json.extract! scholarship, :id, :scholarship_type, :company, :logo, :available, :description
  json.url scholarship_url(scholarship, format: :json)
end
