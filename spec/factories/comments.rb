FactoryBot.define do
  factory :comment do
    micropost_id 1
    user_id 1
    content "MyText"
  end
end
