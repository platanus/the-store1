FactoryBot.define do
  factory :delivery_company do
    name { Faker::Commerce.product_name }
    phone_number { Faker::PhoneNumber.cell_phone }
  end
end
