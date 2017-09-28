User.create(username: 'guest', email: 'guest@example.com', password: '123456')
puts 'Create a Guest for Demo'


u1 = User.create(username: 'Aristotle', email: 'aristotle@example.com', password: '123456')
u1.image = File.new("#{Rails.root}/app/assets/images/aristotle.jpg")
u1.save


# f = File.open("aristotle.jpg")


User.create(username: 'galileo', email: 'galileo@example.com', password: '123456')




User.create(username: 'Plato', email: 'plato@example.com', password: '123456')
User.create(username: 'Pythagoras', email: 'pythagoras@example.com', password: '123456')
User.create(username: 'Rene', email: 'rene@example.com', password: '123456')
User.create(username: 'CSLewis', email: 'cslewis@example.com', password: '123456')
User.create(username: 'Thomas Aquinas', email: 'aquinas@example.com', password: '123456')
User.create(username: 'Epicurus', email: 'epicurus@example.com', password: '123456')
User.create(username: 'Socrates', email: 'socrates@example.com', password: '123456')
User.create(username: 'David Hume', email: 'davidhume@example.com', password: '123456')
User.create(username: 'Isaac Newton', email: 'isaacnewton@example.com', password: '123456')

puts 'Create 11 Users'
