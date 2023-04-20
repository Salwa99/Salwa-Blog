class User < ApplicationRecord
  has_many :posts
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  validates :name, presence: true, uniqueness: true
end
