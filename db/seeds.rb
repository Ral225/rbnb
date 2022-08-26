# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require 'faker'
RentalRequest.destroy_all
ParkingSlot.destroy_all
User.destroy_all


puts "destroyed all users, parking slots, and rental requests"
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  phone = Faker::PhoneNumber.phone_number
  password ="123456"
  u = User.create!(first_name: first_name, last_name: last_name, email: email, phone: phone, password: password)
  puts "new user: #{u.first_name} #{u.last_name}"
end
all_users = User.all
10.times do
  user = all_users.sample
  width = rand(1..10)
  address = "Bali, Canggu"
  price = rand(1..10)
  title = "A great parking slot in #{Faker::Address.city}"
  description = Faker::Quotes::Shakespeare.hamlet
  security = "Camera"
  weather_protection = "Yes"
  currency = "Eur"
  vt = ["car", "motorcycle", "bicycle"]
  vehicle_type = vt.sample
  p = ParkingSlot.create!(security: security, weather_protection: weather_protection, currency: currency, user: user, width: width, address: address, price: price, title: title, description: description, vehicle_type: vehicle_type)
  puts "new parking slot : #{p.address}"
end

5.times do
  user = all_users.sample
  width = rand(1..10)
  address = "Paris"
  price = rand(1..10)
  title = "A great parking slot in #{Faker::Address.city}"
  description = Faker::Quotes::Shakespeare.hamlet
  security = "Camera"
  weather_protection = "Yes"
  currency = "Eur"
  vt = ["car", "motorcycle", "bicycle"]
  vehicle_type = vt.sample
  p = ParkingSlot.create!(security: security, weather_protection: weather_protection, currency: currency, user: user, width: width, address: address, price: price, title: title, description: description, vehicle_type: vehicle_type)
  puts "new parking slot : #{p.address}"
end

all_parking_slots = ParkingSlot.all

10.times do
  user = all_users.sample
  parking_slot = all_parking_slots.sample
  start_date = Faker::Date.forward
  end_date = start_date.next_day(3)
  total_amount = 3
  st = "Pending"
  r = RentalRequest.create!(total_amount: total_amount, user: user, status: st, parking_slot: parking_slot, start_date: start_date, end_date: end_date)
  puts "rental request start_date: #{r.start_date}, end_date: #{r.end_date}"
end


# test data for rental requests for same user with different statuses for testing my-bookings
# declined
user = User.first
parking_slot = all_parking_slots.sample
start_date = Faker::Date.forward
end_date = start_date.next_day(3)
total_amount = 3
st = "Declined"
r = RentalRequest.create!(total_amount: total_amount, user: user, status: st, parking_slot: parking_slot, start_date: start_date, end_date: end_date)
puts "rental request start_date: #{r.start_date}, end_date: #{r.end_date}"

# accepted
parking_slot = all_parking_slots.sample
start_date = Faker::Date.forward
end_date = start_date.next_day(3)
total_amount = 3
st = "Confirmed"
r = RentalRequest.create!(total_amount: total_amount, user: user, status: st, parking_slot: parking_slot, start_date: start_date, end_date: end_date)
puts "rental request start_date: #{r.start_date}, end_date: #{r.end_date}"

# pending
parking_slot = all_parking_slots.sample
start_date = Faker::Date.forward
end_date = start_date.next_day(3)
total_amount = 3
st = "Pending"
r = RentalRequest.create!(total_amount: total_amount, user: user, status: st, parking_slot: parking_slot, start_date: start_date, end_date: end_date)
puts "rental request start_date: #{r.start_date}, end_date: #{r.end_date}"
