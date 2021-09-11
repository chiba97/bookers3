class Book < ApplicationRecord
  belongs_to :user
  validates :title,presence: true
  validates :body,presence: true, length: {maximum: 200}
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  def already_favorited?(user)
    current_user.favorites.exists?(user_id: user.id)
  end
  
end
