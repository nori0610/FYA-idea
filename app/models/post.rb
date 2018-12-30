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

  scope :created_order, -> { order(created_at: desc) }

  def self.ransackable_scopes(_auth_object = nil)
    %i[created_order]
  end
end
