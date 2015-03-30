json.array!(@post_categories) do |post_category|
  json.extract! post_category, :id, :name, :description, :icon
  json.url post_category_url(post_category, format: :json)
end
