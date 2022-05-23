FactoryBot.define do
  factory :user do
    name { Faker::DcComics.hero }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
  end
end
