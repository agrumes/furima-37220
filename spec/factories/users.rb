FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password = Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)
    password              { password }
    password_confirmation { password }
    first_name            { Gimei.first }
    last_name             { Gimei.last }
    first_name_kana       { Gimei.first.katakana }
    last_name_kana        { Gimei.last.katakana }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
