json.array!(@enquiries) do |enquiry|
  json.extract! enquiry, :id, :name, :email, :content
  json.url enquiry_url(enquiry, format: :json)
end
