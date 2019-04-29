class User < ApplicationRecord
  has_secure_password

  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}

  def posts
    return Post.where(user_id: self.id)
  end

  # 対象postにライクをしたかどうか
  def have_like?(post_id)
    if Like.find_by(user_id: id, post_id: post_id).present?
      return true
    end
    false
  end
end
