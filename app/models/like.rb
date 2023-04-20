class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_post_likes_counter
    post.likes_counter = post.likes.count
    post.save
  end

  after_create :update_post_likes_counter
end
