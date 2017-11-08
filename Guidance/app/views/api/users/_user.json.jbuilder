# json.extract! user, :id, :username, :email


json.id user.id
json.username user.username
json.email user.email
json.project_ids user.projects.where(published: true).ids


json.favorite_projects user.favorite_projects.map { |project| project.id }



image = user.image
image_url = image.url.downcase
if(image_url.include?('amazon'))

  type = image.path.include?('jpg') ? 'jpg' : 'png'

  host_url =   '//s3-us-west-1.amazonaws.com/guidance-dev/users/images/'
  image_url = "#{host_url}#{user.id}/medium.#{type}"
end

json.image_url asset_path(image_url)

json.followers user.followers.ids
json.followees user.followees.ids

json.biography user.biography
