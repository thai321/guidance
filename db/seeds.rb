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


u7 = User.create(username: 'Thomas Aquinas', email: 'aquinas@example.com', password: '123456')
u7.image = File.new("#{Rails.root}/app/assets/images/aquinas.jpg")
u7.save

u8 = User.create(username: 'Epicurus', email: 'epicurus@example.com', password: '123456')
u8.image = File.new("#{Rails.root}/app/assets/images/epicurus.jpg")
u8.save

u9 = User.create(username: 'Socrates', email: 'socrates@example.com', password: '123456')
u9.image = File.new("#{Rails.root}/app/assets/images/socrates.jpg")
u9.save


u10 = User.create(username: 'David Hume', email: 'davidhume@example.com', password: '123456')
u10.image = File.new("#{Rails.root}/app/assets/images/davidhume.jpg")
u10.save

u11 = User.create(username: 'Isaac Newton', email: 'isaacnewton@example.com', password: '123456')
u11.image = File.new("#{Rails.root}/app/assets/images/newton.jpg")
u11.save


demo = User.create(username: 'guest', email: 'guest@example.com', password: '123456')
puts 'Create 11 Users and 6 projects'
