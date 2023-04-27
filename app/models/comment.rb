class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  after_save :update_counter

  private

  def update_counter
    post.update(comments_counter: post.comments.count)
  end
end
