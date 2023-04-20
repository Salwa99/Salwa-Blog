class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes
  validates :title, :text, presence: true

  def update_user_posts_counter
    author.posts_counter = author.posts.count
    author.save
  end
end
