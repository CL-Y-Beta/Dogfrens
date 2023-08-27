# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

puts "Cleaning listing database..."
Listing.destroy_all

puts "Cleaning user database..."
User.destroy_all
puts "all clean"

puts 'Creating 5 fake users...'
5.times do |i|
  User.create!(
    email: "user#{i + 1}@email.com",
    password: "123456"
  )
end

puts 'Creating 10 fake listings...'
10.times do
  listing = Listing.new(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price: Faker::Number.number(digits: 3),
    discount: Faker::Number.between(from: 1, to: 8) * 10,
    location: Faker::Address.street_address,
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
