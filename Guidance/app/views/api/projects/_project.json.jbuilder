# json.extract! project, :id, :title, :description, :image_url, :video_url, :published, :author_id

json.id project.id
json.title project.title
json.description project.description
json.video_url project.video_url
json.published project.published
json.author_id project.author_id
json.author project.author.username
json.step_ids project.step_ids


image = project.image
image_url = image.url.downcase

if(image_url.include?('amazon'))

  type = image.path.include?('jpg') ? 'jpg' : 'png'

  host_url =   '//s3-us-west-1.amazonaws.com/guidance-dev/projects/images/'
  image_url = "#{host_url}#{project.id}/medium.#{type}"
end

json.image_url asset_path(image_url)

json.favorite_users project.favorite_users.map { |user| user.id }
