class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_post_comments_counter
    post.comments_counter = post.comments.count
    post.save
  end

  after_create :update_post_comments_counter
end
