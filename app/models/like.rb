class Like < ApplicationRecord
  belongs_to :user
  belongs_to :cmpost
  counter_culture :cmpost
  validates :user_id, presence: true
  validates :cmpost_id, presence: true
end
