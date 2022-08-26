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

#create our test user
first_name = "Tom"
last_name = "Green"
email = "tom@green.com"
phone = Faker::PhoneNumber.phone_number
password ="123456"
tom = User.create!(first_name: first_name, last_name: last_name, email: email, phone: phone, password: password)
puts "new user: #{tom.first_name} #{tom.last_name}"

#create test users

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  phone = Faker::PhoneNumber.phone_number
  password ="123456"
  u = User.create!(first_name: first_name, last_name: last_name, email: email, phone: phone, password: password)
  puts "new user: #{u.first_name} #{u.last_name}"
end




# create parking lots
canggu_addresses = []
canggu_addresses << "78-80 Av. du Général Leclerc, 75014 Paris, France"
canggu_addresses << "41 Av. du Général Leclerc, 75014 Paris, France"
canggu_addresses << "88 Rue de la Tombe Issoire, 75014 Paris, France"
canggu_addresses << "17 Bd de Vaugirard, 75015 Paris, France"
canggu_addresses << "123 Bd de Port-Royal, 75014 Paris, France"
canggu_addresses << "1 Bd de Port-Royal, 75014 Paris, France"
canggu_addresses << "5 Rue des Irlandais, 75005 Paris, France"
canggu_addresses << "1 Rue des Irlandais, 75005 Paris, Frankreich"
canggu_addresses << "70 Rue de la Tombe Issoire, 75014 Paris, France"
canggu_titles = ["Safe Parking Slot", "Underground Parking", "Parking at great location", "Cheap and safe parking", "Parking with security guard at heart of Paris", "Empty garage space", "Large parking space in center", "Paris hotel parking space"]

all_users = User.all

#parking lot tom
user = tom
width = rand(1..10)
address = "60 Rue de la Tombe Issoire, 75014 Paris, France"
price = rand(1..10)
title = "A great parking slot in #{Faker::Address.city}"
description = Faker::Quotes::Shakespeare.hamlet
security = "Camera"
weather_protection = "Yes"
currency = "Eur"
vt = ["car", "motorcycle", "bicycle"]
vehicle_type = vt.sample
p = ParkingSlot.create!(security: security, weather_protection: weather_protection, currency: currency, user: user, width: width, address: address, price: price, title: title, description: description, vehicle_type: vehicle_type)
puts "new parking slot : #{p.address}, owner: #{p.user.email}"

# other oarking lots
canggu_addresses.each do |element|
  user = all_users.sample
  width = rand(1..10)
  address = element
  price = rand(1..10)
  title = "A great parking slot in #{Faker::Address.city}"
  description = Faker::Quotes::Shakespeare.hamlet
  security = "Camera"
  weather_protection = "Yes"
  currency = "Eur"
  vt = ["car", "motorcycle", "bicycle"]
  vehicle_type = vt.sample
  p = ParkingSlot.create!(security: security, weather_protection: weather_protection, currency: currency, user: user, width: width, address: address, price: price, title: title, description: description, vehicle_type: vehicle_type)
  puts "new parking slot : #{p.address}, owner: #{p.user.email}"
end

5.times do
  user = all_users.sample
  width = rand(1..10)
  address = "Paris, France"
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
  address = "Paris, France"
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
index = 0

canggu_titles.each do |element|
 all_parking_slots[index].title = element
 index += 1
 puts "parking slot title changed: #{element}"

end



# create rental requests
# 7.times do
#   user = all_users.sample
#   parking_slot = all_parking_slots.sample
#   start_date = Faker::Date.between(from: '2022-05-23', to: '2022-09-25')
#   add_days = rand(1..10)
#   end_date = start_date + add_days
#   total_amount = add_days
#   st = "Pending"
#   r = RentalRequest.create!(total_amount: total_amount, user: user, status: st, parking_slot: parking_slot, start_date: start_date, end_date: end_date)
#   puts "rental request start_date: #{r.start_date}, end_date: #{r.end_date}, requested_by: #{r.user.email}""
# end


puts "test data for rental requests for same user with different statuses for testing my-bookings"

# declined

user = tom
parking_slot = all_parking_slots[5]
start_date = Faker::Date.between(from: '2022-05-23', to: '2022-09-25')
add_days = rand(1..10)
end_date = start_date + add_days
total_amount = add_days
st = "Declined"
r = RentalRequest.create!(total_amount: total_amount, user: user, status: st, parking_slot: parking_slot, start_date: start_date, end_date: end_date)
  puts "rental request start_date: #{r.start_date}, end_date: #{r.end_date}, requested_by: #{r.user.email}"

# confirmed
user = tom
parking_slot = all_parking_slots[6]
start_date = Faker::Date.between(from: '2022-05-23', to: '2022-09-25')
add_days = rand(1..10)
end_date = start_date + add_days
total_amount = add_days

st = "Confirmed"
r = RentalRequest.create!(total_amount: total_amount, user: user, status: st, parking_slot: parking_slot, start_date: start_date, end_date: end_date)
  puts "rental request start_date: #{r.start_date}, end_date: #{r.end_date}, requested_by: #{r.user.email}"

# pending
user = tom
parking_slot = all_parking_slots[7]
start_date = Faker::Date.between(from: '2022-05-23', to: '2022-09-25')
add_days = rand(1..10)
end_date = start_date + add_days
total_amount = add_days
st = "Pending"
r = RentalRequest.create!(total_amount: total_amount, user: user, status: st, parking_slot: parking_slot, start_date: start_date, end_date: end_date)
  puts "rental request start_date: #{r.start_date}, end_date: #{r.end_date}, requested_by: #{r.user.email}"


puts "test data for request of parking lot of tom green"

#pending
user = all_users[2]
parking_slot = all_parking_slots[0]
start_date = Faker::Date.between(from: '2022-05-23', to: '2022-09-25')
add_days = rand(1..10)
end_date = start_date + add_days
total_amount = add_days
st = "Pending"
r = RentalRequest.create!(total_amount: total_amount, user: user, status: st, parking_slot: parking_slot, start_date: start_date, end_date: end_date)
  puts "rental request start_date: #{r.start_date}, end_date: #{r.end_date},parking lot owner: #{r.parking_slot.user.email}"

user = all_users[5]
parking_slot = all_parking_slots[0]
start_date = Faker::Date.between(from: '2022-05-23', to: '2022-09-25')
add_days = rand(1..10)
end_date = start_date + add_days
total_amount = add_days

st = "Pending"
r = RentalRequest.create!(total_amount: total_amount, user: user, status: st, parking_slot: parking_slot, start_date: start_date, end_date: end_date)
  puts "rental request start_date: #{r.start_date}, end_date: #{r.end_date},parking lot owner: #{r.parking_slot.user.email}"


#confirmed
user = all_users[3]
parking_slot = all_parking_slots[0]
start_date = Faker::Date.between(from: '2022-05-23', to: '2022-09-25')
add_days = rand(1..10)
end_date = start_date + add_days
total_amount = add_days
st = "Confirmed"
r = RentalRequest.create!(total_amount: total_amount, user: user, status: st, parking_slot: parking_slot, start_date: start_date, end_date: end_date)
  puts "rental request start_date: #{r.start_date}, end_date: #{r.end_date},parking lot owner: #{r.parking_slot.user.email}"


user = all_users[4]
parking_slot = all_parking_slots[0]
start_date = Faker::Date.between(from: '2022-05-23', to: '2022-09-25')
add_days = rand(1..10)
end_date = start_date + add_days
total_amount = add_days
st = "Confirmed"
r = RentalRequest.create!(total_amount: total_amount, user: user, status: st, parking_slot: parking_slot, start_date: start_date, end_date: end_date)
puts "rental request start_date: #{r.start_date}, end_date: #{r.end_date},parking lot owner: #{r.parking_slot.user.email}"
