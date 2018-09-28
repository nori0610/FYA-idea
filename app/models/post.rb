class Post < ApplicationRecord
  validates :content, {presence: true, length:{maximum: 140}}
  validates :user_id, {presence: true}

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_one_attached :image

  enum category: {
    service: 10,
    making: 20,
    life: 30,
    other: 40
  }
end
