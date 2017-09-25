json.extract! comment, :id, :description, :project_id, :author_id

json.author comment.author.username

json.time time_ago_in_words(comment.created_at)
