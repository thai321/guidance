
User.destroy_all
Project.destroy_all

# Users

u0 = User.create(username: 'cat0', email: 'cat0@gmail.com', password: '123456')
u1 = User.create(username: 'cat1', email: 'cat1@gmail.com', password: '123456')
u2 = User.create(username: 'cat2', email: 'cat2@gmail.com', password: '123456')
u3 = User.create(username: 'cat3', email: 'cat3@gmail.com', password: '123456')
u4 = User.create(username: 'cat4', email: 'cat4@gmail.com', password: '123456')
u5 = User.create(username: 'cat5', email: 'cat5@gmail.com', password: '123456')
u6 = User.create(username: 'cat6', email: 'cat6@gmail.com', password: '123456')
u7 = User.create(username: 'cat7', email: 'cat7@gmail.com', password: '123456')

puts "Create 8 users"

# projects

p0 = Project.create(title: 'Project0', description: 'Project0 description', image_url: 'image0', video_url: 'video0', author_id: u0.id)
p1 = Project.create(title: 'Project1', description: 'Project1 description', image_url: 'image1', video_url: 'video1', author_id: u1.id)
p2 = Project.create(title: 'Project2', description: 'Project2 description', image_url: 'image2', video_url: 'video2', author_id: u2.id)
p3 = Project.create(title: 'Project3', description: 'Project3 description', image_url: 'image3', video_url: 'video3', author_id: u3.id)
p4 = Project.create(title: 'Project4', description: 'Project4 description', image_url: 'image4', video_url: 'video4', author_id: u4.id)
p5 = Project.create(title: 'Project5', description: 'Project5 description', image_url: 'image5', video_url: 'video5', author_id: u5.id)
p6 = Project.create(title: 'Project6', description: 'Project6 description', image_url: 'image6', video_url: 'video6', author_id: u6.id)
p7 = Project.create(title: 'Project7', description: 'Project7 description', image_url: 'image7', video_url: 'video7', author_id: u7.id)

puts "Create 8 projects"
