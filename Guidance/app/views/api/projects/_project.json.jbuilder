# json.extract! project, :id, :title, :description, :image_url, :video_url, :published, :author_id


json.id project.id
json.title project.title
json.description project.description
json.video_url project.video_url
json.published project.published
json.author_id project.author_id
json.image_url asset_path(project.image.url)
