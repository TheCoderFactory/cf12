json.array!(@testimonials) do |testimonial|
  json.extract! testimonial, :id, :product_id, :name, :one_line, :content, :image, :publish, :gender
  json.url testimonial_url(testimonial, format: :json)
end
