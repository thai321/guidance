# json.extract! project, :id, :title, :description, :image_url, :video_url, :published, :author_id

json.id project.id
json.title project.title
json.description project.description
json.video_url project.video_url
json.published project.published
json.author_id project.author_id
json.step_ids project.step_ids

# image = project.image.url
# if(image.include?('amazon'))
#   host = project.image.url[0..31]
#   path =
#
#
#   temp = project.image.url[0..31] + project.image.url[45..-1]
# end

image = project.image
image_url = image.url

if(image_url.include?('amazon'))

  type = image.path.include?('jpg') ? 'jpg' : 'png'

  host_url =   '//s3-us-west-1.amazonaws.com/guidance-dev/projects/images/'
  image_url = "#{host_url}#{project.id}/medium.#{type}"
end

json.image_url asset_path(image_url)
