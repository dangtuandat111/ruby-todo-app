require 'bcrypt'

FactoryBot.define do
  factory :user do
    username { Faker::Internet.unique.username(specifier: 5..8) }
    email { Faker::Internet.unique.email }
    password { 'password' }
    date_of_birth { Faker::Date.birthday(min_age: 0, max_age: 65) }
    avatar { '' }
  end
end