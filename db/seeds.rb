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


Renter.create(name: "kanye", age: rand(18..35), username: "ye", user_type: "Renter", password: "abc123", train: "4", motto: "i am Warhol. i am shakespeare in the flesh.", img_url: "https://www.etonline.com/sites/default/files/styles/video_1920x1080/public/images/2020-07/eto_a07_kanye_west_070820.jpg?h=d1cb525d&itok=UZ1pJMx1")
Renter.create(name: "keith", age: 29, username: "keithroxx", user_type: "Renter", password: "abc123", train: "r", motto: "Sweating is just your body crying from how awesome you are", img_url: "https://variety.com/wp-content/uploads/2020/10/happykeith.jpg")
Renter.create(name: "jonathan", age: 31, username: "kittenlover24", user_type: "Renter", password: "abc123", train: "L", motto: "I'm not weird, I'm just limited edition", img_url: "https://pbs.twimg.com/profile_images/1238395365973352448/W8ndGx47_400x400.jpg")
Renter.create(name: "lindsey", age: 19, username: "iwenttoFIT", user_type: "Renter", password: "abc123", train: "I only take ubers", motto: "venmo me @lindseymarie", img_url: "https://data.whicdn.com/images/338841571/original.jpg")
Renter.create(name: "taylor", age: 31, username: "tay-tay", user_type: "Renter", password: "abc123", train: "2", motto: "bodegas are our friends.", img_url: "https://api.time.com/wp-content/uploads/2019/04/taylor-swift-time-100-2019-082.jpg?quality=85&zoom=2")




Landlord.create(name: "Paulie Walnuts", location: "north jersey", username: "PAUL!3", user_type: "Landlord", password: "abc123", tool: "duck tape", hustle: "loan shark", img_url: "https://lh3.googleusercontent.com/proxy/gusWe_1KEcMlukbptsWQ9blPeYm2EQt15OQpNdRTGylYvoofnsTKCzEUNfVa5HEcvI8YXqjDB8PujWMlO7wMKAyYq4cl90aGqbsu4mqioJQiCWTchJn9IbehJ08qpBd8ztvKDZiPIahxSO5X_VbO")
Landlord.create(name: "Mikey Blue Eyes", location: "brooklyn", username: "Gymrat2389", user_type: "Landlord", password: "abc123", tool: "spoon", hustle: "life insurance salesman", img_url: "https://media.glassdoor.com/l/0e/f7/d5/87/my-reporting-boss-sales-manager.jpg")
Landlord.create(name: "Chad", location: "long island", username: "chadisgr8", user_type: "Landlord", password: "abc123", tool: "paperclip", hustle: "venture capitalist", img_url: "https://images.squarespace-cdn.com/content/v1/5c0449bfda02bcaf3889ff77/1544458829881-QOUNMC6PL33S4D3U31X5/ke17ZwdGBToddI8pDm48kPRSPILKXoLjfsROGiRbvTFZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpxbusqwWUAvdLKRuH-YnD-xlwZgJYAHQJsLL9pIr18Kt1xrqiqeTjw21g-WPMY6-xM/FleeceVest.jpeg?format=750w", song: "https://archive.org/download/RememberTheName_92/RememberTheName-FortMinorFeat.StylesOfBeyond.mp3")
Landlord.create(name: "Frankie Two Times", location: "bensonhurst", username: "cereal killer", user_type: "Landlord", password: "abc123", tool: "rubberband", hustle: "yankees fanatic", img_url: "https://upload.wikimedia.org/wikipedia/commons/2/2e/Vincent_Pastore_2006_cropped.jpg")


Lease.create(renter_id: Renter.all.sample.id, landlord_id: Landlord.all.sample.id, location: "529 E 17th Street")
Lease.create(renter_id: Renter.all.sample.id, landlord_id: Landlord.all.sample.id, location: "146 Frost Street")
Lease.create(renter_id: Renter.all.sample.id, landlord_id: Landlord.all.sample.id, location: "100 Fuggetaboutit Court")

6.times do 
    Review.create(renter_id: Renter.all.sample.id, landlord_id: Landlord.all.sample.id, rating: rand(1..10), comment: Faker::TvShows::HeyArnold.quote)
end 

puts "Data is seeded"