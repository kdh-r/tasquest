FactoryBot.define do
  factory :task do
    content { 'シャンプー' }
    association :user
  end
end
