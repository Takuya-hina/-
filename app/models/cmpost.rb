class Cmpost < ApplicationRecord
  belongs_to :user, inverse_of: :cmposts
  
  validates :cm_url, presence:true
  validates :cm_title, presence:true
  validates :cm_service, presence:true
  validates :cm_music, presence:true
  validates :content, presence:true
  
  
  has_many :likes, dependent: :destroy
  has_many :iine_users, through: :likes, source: :user
  
  def iine(user)
    likes.create(user_id: user.id)
  end
  
  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end
  
  def iine?(user)
    iine_users.include?(user)
  end
  
end
