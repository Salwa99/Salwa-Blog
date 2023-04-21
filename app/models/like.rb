class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  def post_likes_counter=(count)
    post.update_attribute 'likes_counter', count
  end
end
