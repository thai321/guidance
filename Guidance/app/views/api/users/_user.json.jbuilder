# json.extract! user, :id, :username, :email


json.id user.id
json.username user.username
json.email user.email
json.project_ids user.projects.where(published: true).ids
json.image_url asset_path(user.image.url)
