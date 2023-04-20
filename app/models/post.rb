class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes
  validates :title, :text, presence: true

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_user_posts_counter
    author.posts_counter = author.posts.count
    author.save
  end

  after_save :update_user_posts_counter, if: :saved_change_to_author_id?
end
