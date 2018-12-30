class Post < ApplicationRecord
  validates :content, {presence: true, length:{maximum: 140}}
  validates :user_id, {presence: true}

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :image

  enum category: {
    "社会にいいこと": 10,
    "ものづくり": 20,
    "生活": 30,
    "その他": 40
  }

  SELECT_MAP_FOR_SORT = {
    '新着順': 'created_at desc',
    '注目度順': 'likes_count desc',
    '更新順': 'updated_at desc'
  }.freeze
end
