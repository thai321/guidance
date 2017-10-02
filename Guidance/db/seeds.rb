User.destroy_all
Project.destroy_all
Step.destroy_all
Comment.destroy_all
Follow.destroy_all
Favorite.destroy_all
ProjectTag.destroy_all
Tag.destroy_all



t1 = Tag.create(name: 'Arduino')
t2 = Tag.create(name: 'Math')
t3 = Tag.create(name: 'Computer Science')
t4 = Tag.create(name: 'Music')
t5 = Tag.create(name: 'Other')

puts "Create 5 tags"

demo = User.create(username: 'guest', email: 'guest@example.com', password: '123456')
demo.image = File.new("#{Rails.root}/app/assets/images/thai.jpg")
demo.save

puts "Create Guest account"

load "#{Rails.root}/db/seeds/aristotle.rb"
puts "Create Aristotle and his project"

load "#{Rails.root}/db/seeds/galieo.rb"
puts "Create Galieo and his project"

load "#{Rails.root}/db/seeds/plato.rb"
puts "Create Plato and his project"

load "#{Rails.root}/db/seeds/pythagoras.rb"
puts "Create Pythagoras and his project"


load "#{Rails.root}/db/seeds/rene.rb"
puts "Create Rene and his project"


load "#{Rails.root}/db/seeds/lewis.rb"
puts "Create Lewis and his project"

load "#{Rails.root}/db/seeds/aquinas.rb"
puts "Create Aquinas and his project"


load "#{Rails.root}/db/seeds/epicurus.rb"
puts "Create Epicurus and his project"


load "#{Rails.root}/db/seeds/socrates.rb"
puts "Create Socrates and his project"

load "#{Rails.root}/db/seeds/hume.rb"
puts "Create Hume and his project"


load "#{Rails.root}/db/seeds/newton.rb"
puts "Create Newton and his project"

load "#{Rails.root}/db/seeds/guest.rb"
puts "Create guest's projects"


puts 'Create 12 Users, 15 projects and many steps'


4.times do
  User.ids.each do |id|
    project_id = rand(1..14)
    until !User.find(id).favorite_project_ids.include?(project_id)
      project_id = rand(1..14)
    end

    Favorite.create(project_id: project_id, user_id: id)
  end
end

puts "Create favorite_projects/Likes"

3.times do
  User.ids.each do |id|
    user_id = rand(1..12)
    until user_id != id
      user_id = rand(1..12)
    end

    Follow.create(followee_id: user_id, follower_id: id)
  end
end

puts "Create Followers, Following"
