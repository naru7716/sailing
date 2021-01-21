FactoryBot.define do
  factory :comment do
    user_id { 1 }
    content { "ウネリにあったセッティングがうまくいかなかった。" }
    association :micropost
  end
end