class Like < ApplicationRecord
  belongs_to :post, counter_cache: true

  validates :user_id, {presence: true}
  validates :post_id, {presence: true}
end
