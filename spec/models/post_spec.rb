require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { described_class.new(title: 'First post', text: 'This is the first post') }

  it 'Title attribute should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title attribute should be less than 250 charachter' do
    subject.title = '
      here is my first post, blabla
    ' 
    expect(subject).to_not be_valid
  end

  it 'Comments Counter attribute should be an integer number' do
    subject.comments_counter = 'comment counter'
    expect(subject).to_not be_valid
  end

  it 'Comments Counter attribute should be greater or equal to zero' do
    subject.comments_counter = -4
    expect(subject).to_not be_valid
  end

  it 'Likes Counter attribute should be an integer number' do
    subject.likes_counter = 'likes counter'
    expect(subject).to_not be_valid
  end

  it 'Likes Counter attribute should be greater or equal to zero' do
    subject.likes_counter = -4
    expect(subject).to_not be_valid
  end

  it 'Author posts counter can be set' do
    user = User.new(name: 'Lilly', photo: 'ttps://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am a full stack developer')
    subject.author = user
    subject.user_posts_counter = 3

    expect(subject.author.posts_counter).to be(3)
  end

  it 'last_five_comments method should return the last five comments' do
    post = described_class.create(title: 'Post One', text: 'This is the post one')
    user = User.first

    post.comments = [
      Comment.new({ author: user, text: 'First comment' }),
      Comment.new({ author: user, text: 'Second comment' }),
      Comment.new({ author: user, text: 'Third comment' }),
      Comment.new({ author: user, text: 'Fourth comment' }),
      Comment.new({ author: user, text: 'Fifth comment' })
    ]

    expect(post.last_five_comments.size).to be(5)
    expect(post.last_five_comments.pluck(:id)).to match_array(post.comments.last(5).pluck(:id))
  end
end
