FactoryBot.define do
  factory :micropost do
    name { "大会１ヶ月前" }
    description { "レース艇のセッティングの見直しを海上で行った。" }
    team { "あああ大学" }
    wind { "南南東" }
    maintenance { "グースネック交換" }
    time { 1 }
    association :user
  end
end
