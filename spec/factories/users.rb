FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "secret1234567" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    city { Faker::Address.city }
  end
end
