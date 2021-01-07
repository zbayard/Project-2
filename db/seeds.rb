# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Lease.destroy_all
Review.destroy_all
Renter.destroy_all 
Landlord.destroy_all 

6.times do 
    Renter.create(name: Faker::FunnyName.three_word_name, age: rand(18..35), username: Faker::Hipster.word, user_type: "Renter", password: "abc123")
end 

# 3.times do 
#     Landlord.create(name: Faker::FunnyName.four_word_name, location: Faker::TvShows::GameOfThrones.city, username: Faker::TvShows::GameOfThrones.character, user_type: "Landlord", password: "abc123")
# end

Landlord.create(name: "Paulie Walnuts", location: "North Jersey", username: Faker::TvShows::GameOfThrones.character, user_type: "Landlord", password: "abc123", tool: "duck tape", hustle: "loan shark", img_url: "https://lh3.googleusercontent.com/proxy/gusWe_1KEcMlukbptsWQ9blPeYm2EQt15OQpNdRTGylYvoofnsTKCzEUNfVa5HEcvI8YXqjDB8PujWMlO7wMKAyYq4cl90aGqbsu4mqioJQiCWTchJn9IbehJ08qpBd8ztvKDZiPIahxSO5X_VbO")
Landlord.create(name: "Mikey Blue Eyes", location: "Brooklyn", username: Faker::TvShows::GameOfThrones.character, user_type: "Landlord", password: "abc123", tool: "spoon", hustle: "life insurance salesman", img_url: "https://media.glassdoor.com/l/0e/f7/d5/87/my-reporting-boss-sales-manager.jpg")
Landlord.create(name: "Chad", location: "Staten Island", username: Faker::TvShows::GameOfThrones.character, user_type: "Landlord", password: "abc123", tool: "paperclip", hustle: "venture capitalist", img_url: "https://images.squarespace-cdn.com/content/v1/5c0449bfda02bcaf3889ff77/1544458829881-QOUNMC6PL33S4D3U31X5/ke17ZwdGBToddI8pDm48kPRSPILKXoLjfsROGiRbvTFZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpxbusqwWUAvdLKRuH-YnD-xlwZgJYAHQJsLL9pIr18Kt1xrqiqeTjw21g-WPMY6-xM/FleeceVest.jpeg?format=750w")
Landlord.create(name: "Frankie Two Times", location: "Bensonhurst", username: Faker::TvShows::GameOfThrones.character, user_type: "Landlord", password: "abc123", tool: "rubberband", hustle: "yankees fanatic", img_url: "https://upload.wikimedia.org/wikipedia/commons/2/2e/Vincent_Pastore_2006_cropped.jpg")

Lease.create(renter_id: Renter.all.sample.id, landlord_id: Landlord.all.sample.id, location: "529 E 17th Street")
Lease.create(renter_id: Renter.all.sample.id, landlord_id: Landlord.all.sample.id, location: "146 Frost Street")
Lease.create(renter_id: Renter.all.sample.id, landlord_id: Landlord.all.sample.id, location: "100 Fuggetaboutit Court")

6.times do 
    Review.create(renter_id: Renter.all.sample.id, landlord_id: Landlord.all.sample.id, rating: rand(1..10), comment: Faker::TvShows::HeyArnold.quote)
end 

puts "Data is seeded"