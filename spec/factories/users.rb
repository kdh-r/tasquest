FactoryBot.define do
  factory :user do
    name { Faker::Internet.username }
    email {Faker::Internet.free_email}
    password {'111aaa'}
  end
end