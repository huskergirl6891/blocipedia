5.times do
  User.create!(
  email:    Faker::Internet.unique.email,
  password: Faker::Internet.password(8)
  )
end
users = User.all

# Create wikis
50.times do
  wiki = Wiki.create!(
    user: users.sample,
    title: Faker::Superhero.name,
    body: Faker::ChuckNorris.fact,
    private: false
  )
end
wikis = Wiki.all

# Create an admin user
admin = User.create!(
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)

# Create a standard user
standard = User.create!(
  email:    'carissabcastro@gmail.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
