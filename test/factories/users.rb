require 'bcrypt'

FactoryBot.define do
  factory :user do
    username { Faker::Internet.unique.username(specifier: 5..8) }
    sequence(:email) { |n| "a#{format('%03d', n)}@gmail.com" }
    hash_pw { BCrypt::Password.create('123456') }
    date_of_birth { Faker::Date.birthday(min_age: 0, max_age: 65) }
    avatar { '' }
  end
end