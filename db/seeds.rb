# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Tag.create(name: 'Smoking Allowed')
# Tag.create(name: 'Pets Allowed')
# Tag.create(name: 'Pool')
# Tag.create(name: 'Free Parking')
# Tag.create(name: 'Air Conditioning')
# Tag.create(name: 'Wifi')
# Tag.create(name: 'Heating')

# Seed Users
user = {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email

    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }
ActiveRecord::Base.transaction do
  40.times do 
    listing['home_type'] = ["Shared Room", "Private Room", "Entire Home/Apt"].sample
    listing['listing_type'] = ["House", "Apartment"].sample
    listing['accommodate'] = rand(0..16)
    listing['bedroom'] = rand(1..10)
    listing['bathroom'] = rand(1..8)
    listing['address'] = Faker::Address.street_address
    listing['city'] = Faker::Address.city
    listing['summary'] = Faker::Hipster.sentence
    listing['price'] = rand(80..500)
    
    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end