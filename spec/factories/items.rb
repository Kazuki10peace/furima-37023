FactoryBot.define do
  factory :item do
    name                   {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    info                   {Faker::Lorem.characters(number: 100, min_alpha: 1, min_numeric: 1) }
    category_id            {Faker::Number.between(from: 2, to: 11)}
    sales_status_id        {Faker::Number.between(from: 2, to: 6)}
    shipping_fee_id        {Faker::Number.between(from: 2, to: 3)}
    prefecture_id          {Faker::Number.between(from: 2, to: 48)}
    scheduled_delivery_id  {Faker::Number.between(from: 2, to: 4)}
    price                  {Faker::Number.between(from: 1, to: 9999999)}
    association :user
  end
end
