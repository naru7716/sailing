class Comment < ApplicationRecord
end
class Comment < ApplicationRecord
  belongs_to :micropost
  validates :user_id, presence: true
  validates :micropost_id, presence: true
  validates :content, presence: true, length: { maximum: 50 }
end
