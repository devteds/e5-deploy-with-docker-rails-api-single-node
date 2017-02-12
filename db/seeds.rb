100.times do |i|
    Post.create title: "blog post #{i+1}", body: "some body content for #{i+1}"
end