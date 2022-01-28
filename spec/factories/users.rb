FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(min_alpha: 1, min_numric: 1, min_length: 6)}
    password_confirmation {password}
    last_name             {}
    first_name            {}
    last_name_kana        {}
    first_name_kana       {}
    birth_date            {}
  end
end