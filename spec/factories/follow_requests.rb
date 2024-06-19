FactoryBot.define do
  factory :follow_request do
    follower_id { 1 }
    followed { 1 }
    status { "MyString" }
  end
end
