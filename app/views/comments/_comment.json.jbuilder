json.extract! comment, :id, :my_thread_id, :body, :created_at, :updated_at
json.url comment_url(comment, format: :json)
