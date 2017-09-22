# json.extract! project, :id, :title, :description, :image_url, :video_url, :published, :author_id


json.id project.id
json.title project.title
json.description project.description
json.video_url project.video_url
json.published project.published
json.author_id project.author_id

temp = project.image.url
if(temp.include?('amazon'))
  temp = project.image.url[0..31] + project.image.url[45..-1]
end

json.image_url asset_path(temp)
