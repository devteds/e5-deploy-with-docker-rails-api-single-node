# json.array! @posts, partial: 'posts/post', as: :post

json.array! @posts do |post|
    json.extract! post, :id, :title
    json.created_at l(post.created_at, format: :short) 
    json.url post_url(post, format: :json)
end