class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, touch: true # NOTE: touch: trueとしているのは、postsを更新順でソートした際に、comment投稿も考慮するため
  validates :content, presence: true
  has_one_attached :image
end
