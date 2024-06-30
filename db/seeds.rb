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
User.create(username: 'tom', email: 'tom@example.com', password: '121212', avatar_url: 'avatars/avatar_01.png')
User.create(username: 'peter', email: 'peter@example.com', password: '121212', avatar_url: 'avatars/avatar_02.png')
User.create(username: 'dave', email: 'dave@example.com', password: '121212', avatar_url: 'avatars/avatar_03.png')
User.create(username: 'lance', email: 'lance@example.com', password: '121212', avatar_url: 'avatars/avatar_03.png')
User.create(username: 'bill', email: 'bill@example.com', password: '121212', avatar_url: 'avatars/avatar_04.png')
User.create(username: 'sam', email: 'sam@example.com', password: '121212', avatar_url: 'avatars/avatar_05.png')
User.create(username: 'larry', email: 'larry@example.com', password: '121212', avatar_url: 'avatars/avatar_06.png')
User.create(username: 'conan', email: 'conan@example.com', password: '121212', avatar_url: 'avatars/avatar_07.png')
User.create(username: 'jeff', email: 'jeff@example.com', password: '121212', avatar_url: 'avatars/avatar_08.png')

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

# Create comments
Post.all.each do |post|
  rand(1..5).times do
    Comment.create(
      body: Faker::Lorem.sentence,
      post_id: post.id,
      user_id: User.pluck(:id).sample
    )
  end
end

p "created #{Comment.count} comments"

User.all.each do |user|
  Post.all.sample(rand(1..5)).each do |post|
    Like.find_or_create_by(user: user, post: post)
  end
end
