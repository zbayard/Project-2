# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Review.destroy_all
Renter.destroy_all 
Landlord.destroy_all 

6.times do 
    Renter.create(name: Faker::FunnyName.three_word_name, age: rand(18..35), username: Faker::Hipster.word, user_type: "Renter", password: "abc123")
end 

# 3.times do 
#     Landlord.create(name: Faker::FunnyName.four_word_name, location: Faker::TvShows::GameOfThrones.city, username: Faker::TvShows::GameOfThrones.character, user_type: "Landlord", password: "abc123")
# end

Landlord.create(name: "Paulie Walnuts", location: "North Jersey", username: Faker::TvShows::GameOfThrones.character, user_type: "Landlord", password: "abc123")
Landlord.create(name: "Mikey Blue Eyes", location: "Brooklyn", username: Faker::TvShows::GameOfThrones.character, user_type: "Landlord", password: "abc123")
Landlord.create(name: "Frankie Two Times", location: "Staten Island", username: Faker::TvShows::GameOfThrones.character, user_type: "Landlord", password: "abc123")

Lease.create(renter_id: Renter.all.sample.id, landlord_id: Landlord.all.sample.id, location: "529 E 17th Street")
Lease.create(renter_id: Renter.all.sample.id, landlord_id: Landlord.all.sample.id, location: "146 Frost Street")
Lease.create(renter_id: Renter.all.sample.id, landlord_id: Landlord.all.sample.id, location: "100 Fuggetaboutit Court")

6.times do 
    Review.create(renter_id: Renter.all.sample.id, landlord_id: Landlord.all.sample.id, rating: rand(1..10), comment: Faker::TvShows::HeyArnold.quote)
end 

puts "Data is seeded"