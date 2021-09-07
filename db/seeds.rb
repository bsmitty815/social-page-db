# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Profile.destroy_all

a = User.create(username: "admin", password: "admin", password_confirmation: "admin")
b = User.create(username: Faker::Superhero.name, password: "admin", password_confirmation: "admin")
c = User.create(username: Faker::Superhero.name, password: "admin", password_confirmation: "admin")
d = User.create(username: Faker::Superhero.name, password: "admin", password_confirmation: "admin")
e = User.create(username: Faker::Superhero.name, password: "admin", password_confirmation: "admin")
f = User.create(username: Faker::Superhero.name, password: "admin", password_confirmation: "admin")
g = User.create(username: Faker::Superhero.name, password: "admin", password_confirmation: "admin")
h = User.create(username: Faker::Superhero.name, password: "admin", password_confirmation: "admin")

#dont need to make a profile now because every time a user is created a profile is created for them automatically
#Profile.create(user_id: a.id, image: "" , bio: "test bio", status: "test status")

puts "seed done"