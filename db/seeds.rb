require 'faker'

5.times do
  User.create!(
    email:    Faker::Internet.email,
    password: "helloworld",
    confirmed_at: Time.now
  )
end
users = User.all

20.times do
  RegisteredApplication.create!(
    user: users.sample,
    name: Faker::Lovecraft.deity,
    url: Faker::Internet.url
  )
end

applications = RegisteredApplication.all

25.times do
 Event.create!(
   registered_application: applications.sample,
   name: Faker::Lovecraft.word
 )
end
events = Event.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
