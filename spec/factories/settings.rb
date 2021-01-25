FactoryBot.define do
  factory :setting do
    name { "マストレーキ" }
    value { "6750mm" }
    association :micropost
  end
end
