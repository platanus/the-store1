FactoryBot.define do
  factory :review do
    comment { Faker::Lorem.sentence }
    item
    user
  end
end
