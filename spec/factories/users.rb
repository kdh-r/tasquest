FactoryBot.define do
  factory :user do
    name { 'aaaaaa' }
    email { Faker::Internet.free_email }
    password { '111aaa'}
  end
end
