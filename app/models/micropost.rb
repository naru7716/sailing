class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 140 }
  validates :team, length: { maximum: 20 }
  validates :wind, length: { maximum: 30 }
  validates :maintenance, length: { maximum: 50 }
  validates :time,
            :numericality => {
              :only_interger => true,
              :greater_than_or_equal_to => 1,
              :less_than_or_equal_to => 10
            },
            allow_nil: true
end
