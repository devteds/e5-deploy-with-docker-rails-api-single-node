json.extract! post, :id, :title, :body
json.created_at l(post.created_at, format: :short)
json.updated_at l(post.updated_at, format: :short)
json.url post_url(post, format: :json)