class Post < ApplicationRecord
  validates :content, {presence: true, length:{maximum: 140}}
  validates :user_id, {presence: true}

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :image

  # 1ページに表示する枚数
  paginates_per 6

  scope :recommend, -> {
    joins(:likes)
      .group(:id)
      .order('count(posts.id) DESC')
      .where(
        likes: {
          created_at: Time.zone.yesterday.beginning_of_day..Time.zone.yesterday.end_of_day
        }
    )
  }

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

  def likes_count
    likes.count
  end
end
