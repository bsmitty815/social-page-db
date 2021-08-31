# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Profile.destroy_all

a = User.create(username: "admin", image: "" ,password: "admin", password_confirmation: "admin")

Profile.create(user_id: a.id, bio: "test bio", status: "test status")

puts "seed done"