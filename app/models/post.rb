class Post < ApplicationRecord
  validates :content, {presence: true, length:{maximum: 140}}
  validates :user_id, {presence: true}

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_one_attached :image

  enum category: {
    "社会にいいこと": 10,
    "ものづくり": 20,
    "生活": 30,
    "その他": 40
  }
end
