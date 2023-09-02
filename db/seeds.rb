# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

puts "Cleaning listing database..."
Bookmark.destroy_all
Listing.destroy_all

puts "Cleaning user database..."
User.destroy_all
puts "all clean"

puts 'Creating 5 fake users...'
5.times do |i|
  Faker::Config.locale = 'en-SG'
  User.create!(
    email: "user#{i + 1}@email.com",
    password: "123456",
    mobile: "91234567",
    address: Faker::Address.street_address,
    description: Faker::Lorem.sentence
  )
end

puts 'Creating 15 fake listings...'
15.times do
  Faker::Config.locale = 'en-SG'
  listing = Listing.new(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph_by_chars(number: 250, supplemental: false),
    price: Faker::Number.number(digits: 3),
    discount: Faker::Number.between(from: 1, to: 8) * 10,
    location: Faker::Address.street_address,
    category:["food", "supplies", "grooming", "accessories"].sample,
    redeem_description: Faker::Lorem.paragraph_by_chars(number: 2000, supplemental: false),
    user_id: User.all.sample.id,
    quantity_left: Faker::Number.between(from: 1, to: 20)
  )
  listing.save!
end

puts "Creating 10 bookings... "
10.times do
  listing = Listing.order("RANDOM()").first
  user = User.order("RANDOM()").first
  booking = Booking.new(
    listing_id: listing.id,
    service_provider_id: user.id,
    dog_owner_id: user.id,
    confirmed: false,
    booking_price: listing.price
  )
  booking.save
  puts "booking #{booking.id} has been created."
end
