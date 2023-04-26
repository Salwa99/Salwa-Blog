require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { User.create(name: 'Salwa', posts_counter: 0) }
  let!(:post) { Post.create(author: user, title: 'My blog', likes_counter: 0, comments_counter: 0) }

  describe 'GET /users/:user_id/posts' do
    it 'Return 200 OK status' do
      get user_posts_path(user_id: user.id)
      expect(response).to have_http_status(200)
    end

    it 'Render the index template' do
      get user_posts_path(user_id: user.id)
      expect(response).to render_template(:index)
    end

    it "includes the correct placeholder text in the response body 'Welcome to the post section!'" do
      get user_posts_path(user_id: user.id)
      expect(response.body).to include('Welcome to the post section!')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'Return 200 OK status' do
      get user_post_path(user_id: user.id, id: post.id)
      expect(response).to have_http_status(200)
    end

    it 'Render the show template' do
      get user_post_path(user_id: user.id, id: post.id)
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      get user_post_path(user_id: user.id, id: post.id)
      expect(response.body).to include(post.title)
    end
  end
end
