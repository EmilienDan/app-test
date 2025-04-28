# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Booking.destroy_all
puts "Booking destroyed"
Offer.destroy_all
puts "Offers destroyed"
User.destroy_all
puts "Users destroyed"

user1 = User.create!(email: "mario@gmail.com", password: "abcdefg")
user2 = User.create!(email: "luigi@gmail.com", password: "abcdefg")

Offer.create!(user: user1, hotel_name: "Bling Bling Palace", description: "Super cool place!", location: "Nantes, France", price: 75, photo_url: "palace.jpg")
Offer.create!(user: user2, hotel_name: "Hotel F1", description: "Shit hole", location: "Paris, France", price: 20, photo_url: "hotelf1.jpg")
