FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@test.com'}
    password              {'abc123'}
    password_confirmation {password}
  end
end