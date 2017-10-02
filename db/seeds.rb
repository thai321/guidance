User.destroy_all
Project.destroy_all
Step.destroy_all
Comment.destroy_all
Follow.destroy_all


t1 = Tag.create(name: 'Arduino')
t2 = Tag.create(name: 'Math')
t3 = Tag.create(name: 'Computer Science')
t4 = Tag.create(name: 'Music')
t5 = Tag.create(name: 'Other')


load "#{Rails.root}/db/seeds/aristotle.rb"
load "#{Rails.root}/db/seeds/galieo.rb"
load "#{Rails.root}/db/seeds/plato.rb"
load "#{Rails.root}/db/seeds/pythagoras.rb"
load "#{Rails.root}/db/seeds/rene.rb"
load "#{Rails.root}/db/seeds/lewis.rb"
load "#{Rails.root}/db/seeds/aquinas.rb"
load "#{Rails.root}/db/seeds/epicurus.rb"
load "#{Rails.root}/db/seeds/socrates.rb"
load "#{Rails.root}/db/seeds/hume.rb"





u11 = User.create(username: 'Isaac Newton', email: 'isaacnewton@example.com', password: '123456')
u11.image = File.new("#{Rails.root}/app/assets/images/newton.jpg")
u11.save


demo = User.create(username: 'guest', email: 'guest@example.com', password: '123456')
puts 'Create 11 Users and 6 projects'
