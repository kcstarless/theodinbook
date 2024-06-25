# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Destroy all data
Comment.destroy_all
Like.destroy_all
FollowRequest.destroy_all
Post.destroy_all
User.destroy_all

# Create User data
User.create(username: 'tom', email: 'tom@example.com', password: '121212')
User.create(username: 'peter', email: 'peter@example.com', password: '121212')
User.create(username: 'dave', email: 'dave@example.com', password: '121212')

p "created #{User.count} users"

# Get all Users
# Users = User.all

# Create posts

20.times do
  Post.create(title: Faker::Locations::Australia.location,
              body: Faker::Lorem.paragraphs(number: 10, supplemental: false).join("\n\n"),
              user_id: User.all.sample.id)
end

p "created #{Post.count} posts"

# Create flight data
# Users.each_with_index do |departure_User, index|
#   next_Use = Uses[(index + 1) % Uses.size] # Ensures arrival Use is different
#   10.times do
#     Flight.create(departure_User: departure_User,
#                   arrival_User: next_Use,
#                   flight_date_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30),
#                   flight_duration: Faker::Number.between(from: 60, to: 720))
#   end
# end

# p "created #{Flight.count} flights"
