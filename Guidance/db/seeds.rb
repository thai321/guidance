
User.destroy_all
Project.destroy_all
Step.destroy_all
Comment.destroy_all


# Demo
demo = User.create(username: 'ThaiNguyen', email: 'thai.nguyen@berkeley.edu', password: '123456')
Project.create(title: 'Demo Project1', description: 'Project1, description', author_id: demo.id)
Project.create(title: 'Demo Project1.1', description: 'Project1.1, description', author_id: demo.id)

puts "Create a demo account and 2 demo projects"

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

p0 = Project.create(title: 'Project0', description: 'Project0, description', author_id: u0.id)
p1 = Project.create(title: 'Project1', description: 'Project1, description', author_id: u1.id)
p2 = Project.create(title: 'Project2', description: 'Project2, description', author_id: u2.id)
p3 = Project.create(title: 'Project3', description: 'Project3, description', author_id: u3.id)
p4 = Project.create(title: 'Project4', description: 'Project4, description', author_id: u4.id)
p5 = Project.create(title: 'Project5', description: 'Project5, description', author_id: u5.id)
p6 = Project.create(title: 'Project6', description: 'Project6, description', author_id: u6.id)
p7 = Project.create(title: 'Project7', description: 'Project7, description', author_id: u7.id)

p0 = Project.create(title: 'Project0.1', description: 'Project0.1, description', author_id: u0.id, published: true)
p1 = Project.create(title: 'Project1.1', description: 'Project1.1, description', author_id: u1.id, published: true)
p2 = Project.create(title: 'Project2.1', description: 'Project2.1, description', author_id: u2.id, published: true)
p3 = Project.create(title: 'Project3.1', description: 'Project3.1, description', author_id: u3.id, published: true)
p4 = Project.create(title: 'Project4.1', description: 'Project4.1, description', author_id: u4.id, published: true)
p5 = Project.create(title: 'Project5.1', description: 'Project5.1, description', author_id: u5.id, published: true)
p6 = Project.create(title: 'Project6.1', description: 'Project6.1, description', author_id: u6.id, published: true)
p7 = Project.create(title: 'Project7.1', description: 'Project7.1, description', author_id: u7.id, published: true)

puts "Create 16 projects"


Project.all.each do |project|
  3.times do |i|
    Step.create(title: "step #{i}", body: "Body...", project_id: project.id)
  end
  puts "Create 3 steps for project #{project.id}"
end


Project.all.each do |project|
  User.all.each do |user|
    Comment.create(description: "#{user.username} Comment on project #{project.title}", project_id: project.id, author_id: user.id)
  end

  puts "Created #{User.all.length} for #{project.title}"
end
