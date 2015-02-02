json.array!(@authors) do |author|
  json.extract! author, :id, :name, :profile_picture, :slug, :google_plus, :linkedin, :twitter, :github, :website, :title, :info
  json.url author_url(author, format: :json)
end
