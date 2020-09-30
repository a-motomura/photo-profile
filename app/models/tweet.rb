class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  has_many   :comments
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image, :name, :genre_id, :introduction, :place
  end

  validates :genre_id, numericality: { other_than: 0, message: "can't be blank" }
end
