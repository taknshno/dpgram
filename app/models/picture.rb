class Picture < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :content, length: { maximum: 100 }
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
