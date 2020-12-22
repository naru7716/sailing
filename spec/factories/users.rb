FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "example#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    introduction { "はじめまして。20歳大学生です" }
    sex { "男性" }
  end
end
