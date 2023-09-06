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
    username: Faker::Name.name,
    email: "user#{i + 1}@email.com",
    password: 'password',
    mobile: "91234567",
    address: Faker::Address.street_address,
    description: Faker::Lorem.sentence
  )
end

# db/seeds.rb

puts 'Creating 15 listings...'
dog_services = [
  { title: 'Fluffy Tails Dog Walking', description: 'We make sure your dog gets the exercise and mental stimulation they need with our guided neighborhood walks.', redeem_description: 'Redeem for a 30-minute walk.', address: '123 Orchard Road, Singapore 238813' },
  { title: 'Paws and Relax Dog Spa', description: 'Our luxury spa service includes a thorough cleaning, fur conditioning, and a paw-dicure to make your dog feel refreshed.', redeem_description: 'Redeem for a full spa day for your pup.', address: '45 Tanjong Pagar Rd, Singapore 088466' },
  { title: 'K-9 Obedience School', description: 'From basic commands to advanced tricks, our obedience classes cater to dogs of all levels and breeds.', redeem_description: 'Redeem for a 1-hour introductory training session.', address: '102 Serangoon Ave, Singapore 556102' },
  { title: 'Buddy\'s Doggy Daycare', description: 'A safe and fun environment for your dog to socialize and play while you\'re busy or at work.', redeem_description: 'Redeem for a day of doggy daycare.', address: '67 Holland Village, Singapore 278984' },
  { title: 'Fetch! Pet Supplies', description: 'Offering a wide range of organic food, toys, and accessories to keep your canine companion happy and healthy.', redeem_description: 'Redeem for a $20 voucher on your next purchase.', address: '21 River Valley Rd, Singapore 179030' },
  { title: 'The Hound Lounge', description: 'Let your dog socialize in our off-leash park while you enjoy a cup of coffee at our café.', redeem_description: 'Redeem for a coffee and 1-hour playtime for your dog.', address: '99 Bukit Timah Rd, Singapore 229835' },
  { title: 'Sniff & Seek Treasure Hunts', description: 'Keep your dog\'s mind and nose active with our weekly treasure hunts designed to stimulate their senses.', redeem_description: 'Redeem for entry into next weekend\'s treasure hunt.', address: '56 Joo Chiat Rd, Singapore 427079' },
  { title: 'Canine Cab', description: 'We offer safe and reliable transportation for your dogs to vet appointments, grooming sessions, and more.', redeem_description: 'Redeem for a free one-way ride within 10km.', address: '36 East Coast Rd, Singapore 428756' },
  { title: 'Pup-a-licious Gourmet Bites', description: 'Homemade treats that are as nutritious as they are delicious. Perfect for training or just spoiling your pup.', redeem_description: 'Redeem for a pack of gourmet dog treats.', address: '48 Tampines Ave, Singapore 529866' },
  { title: 'Furry Friend Pet Photography', description: 'Capture the essence of your dog\'s personality with a professional photoshoot. Various themes and packages available.', redeem_description: 'Redeem for a free 8x10 print from your session.', address: '89 Sentosa Cove, Singapore 098297' },
  { title: 'HealthyPaws Veterinary Clinic', description: 'Quality and compassionate care for your pets with 24/7 emergency services available.', redeem_description: 'Redeem for a 20% discount on the first consultation.', address: '32 Raffles Place, Singapore 048622' },
  { title: 'Pooch Playground', description: 'An open space where dogs can run freely, climb obstacles and socialize under expert supervision.', redeem_description: 'Redeem for 3 hours of supervised playtime.', address: '12 Suntec City Mall, Singapore 038983' },
  { title: 'Doggie Fashionista', description: 'From raincoats to summer tees, we have the perfect clothing for your furry friend.', redeem_description: 'Redeem for a 10% discount on your next purchase.', address: '5 Clarke Quay, Singapore 179024' },
  { title: 'Whiskers & Tails Pet Hotel', description: 'Leave your dog in trusted hands with cage-free boarding, daily walks, and plenty of socialization.', redeem_description: 'Redeem for a one-night free stay.', address: '70 Marina Bay Sands, Singapore 018956' },
  { title: 'Agility Masters Training', description: 'Take your dog\'s physical fitness and mental sharpness to the next level with agility training courses.', redeem_description: 'Redeem for a free agility trial session.', address: '29 Woodlands Ave, Singapore 739065' },
]

# Seeding the database with listings
dog_services.each do |service|
  Listing.create!(
    title: service[:title],
    description: service[:description],
    redeem_description: service[:redeem_description],
    location: service[:address],
    category: ["food", "supplies", "grooming", "accessories"].sample,
    user_id: User.all.sample.id,
    price: Faker::Number.number(digits: 3),
    discount: Faker::Number.between(from: 1, to: 8) * 10,
    quantity_left: Faker::Number.between(from: 1, to: 20)
  )
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
