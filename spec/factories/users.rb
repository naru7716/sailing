FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "example#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    introduction { "はじめまして。大学で4年間、470級に乗っていました！" }
    sex { "男性" }
  end
end
