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

20.times do 
    Renter.create(name: Faker::FunnyName.three_word_name, age: rand(10..110), username: Faker::Hipster.word, user_type: "Renter", password: "abc123")
end 

20.times do 
    Landlord.create(name: Faker::FunnyName.four_word_name, location: Faker::TvShows::GameOfThrones.city, username: Faker::TvShows::GameOfThrones.character, user_type: "Landlord", password: "abc123")
end

# 40.times do 
#     Lease.create(date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short), renter_id: Renter.all.sample.id, landlord_id: Landlord.all.sample.id, home_name: Faker::Address.street_name)
# end 

20.times do 
    Review.create(renter_id: Renter.all.sample.id, landlord_id: Landlord.all.sample.id, rating: rand(1..100), comment: Faker::TvShows::HeyArnold.quote)
end 

puts "Data is seeded"