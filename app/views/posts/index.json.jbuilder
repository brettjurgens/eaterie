json.array!(@posts) do |post|
  json.extract! post, :id, :image_url, :description
  json.url post_url(post, format: :json)
end
