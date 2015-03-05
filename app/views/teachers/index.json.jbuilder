json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :image, :title, :link, :blurb
  json.url teacher_url(teacher, format: :json)
end
