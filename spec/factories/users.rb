FactoryBot.define do
  factory :user do
    name { Faker::Lorem.word }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :group do
    name { Faker::Lorem.word }
    icon { Faker::Internet.url }
    association :author, factory: :user
  end
  factory :entity do
    name { Faker::Lorem.word }
    amount { Faker::Number.between(from: 1, to: 1000) }
  end
end
