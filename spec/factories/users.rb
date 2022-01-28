FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(min_alpha: 1, min_numric: 1, min_length: 6)}
    password_confirmation {password}
    last_name             {Gimei.name.last.kanji.hiragana.katakana}
    first_name            {Gimei.name.first.kanji.hiragana.katakana}
    last_name_kana        {Gimei.last.katakana}
    first_name_kana       {Gimei.first.katakana}
    birth_date            {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end