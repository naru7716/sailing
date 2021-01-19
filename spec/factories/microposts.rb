FactoryBot.define do
  factory :micropost do
    name { "大会１ヶ月前" }
    description { "レース艇のセッティングの見直しを海上で行った。" }
    team { "あああ大学" }
    wind { "南南東" }
    maintenance { "グースネック交換" }
    time { 1 }
    association :user
    created_at { Time.current }
  end
  
  trait :yesterday do
    created_at { 1.day.ago }
  end

  trait :one_week_ago do
    created_at { 1.week.ago }
  end

  trait :one_month_ago do
    created_at { 1.month.ago }
  end

  trait :picture do
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_micropost.jpg')) }
  end
end
