class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many   :comments
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :genre

  
  validates :image, :name, :genre_id, :introduction, :place, presence: true

  validates :name, length: { maximum: 20 }
  validates :introduction, length: { maximum: 100 }
  validates :place, length: { maximum: 50 }
  validates :other, length: { maximum: 100 }
  validates :genre_id, numericality: { other_than: 0, message: "can't be blank" }
end
