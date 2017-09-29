demo = User.create(username: 'guest', email: 'guest@example.com', password: '123456')




u1 = User.create(username: 'Aristotle', email: 'aristotle@example.com', password: '123456')
u1.image = File.new("#{Rails.root}/app/assets/images/aristotle.jpg")
u1.save


u2 = User.create(username: 'galileo', email: 'galileo@example.com', password: '123456')
u2.image = File.new("#{Rails.root}/app/assets/images/galileo.jpg")
u2.save


u3 = User.create(username: 'Plato', email: 'plato@example.com', password: '123456')
u3.image = File.new("#{Rails.root}/app/assets/images/plato.jpg")
u3.save


u4 = User.create(username: 'Pythagoras', email: 'pythagoras@example.com', password: '123456')
u4.image = File.new("#{Rails.root}/app/assets/images/pythagoras.jpg")
u4.save

u5 = User.create(username: 'Rene Descartes', email: 'rene@example.com', password: '123456')
u5.image = File.new("#{Rails.root}/app/assets/images/rene.jpg")
u5.save


u6 = User.create(username: 'CSLewis', email: 'cslewis@example.com', password: '123456')
u6.image = File.new("#{Rails.root}/app/assets/images/lewis.jpg")
u6.save


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


puts 'Create 11 Users'
