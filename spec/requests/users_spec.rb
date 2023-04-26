require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path }

    it 'Success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'users' template" do
      expect(response).to render_template('users/index')
    end

    it "includes 'Welcome to the Blog App!' in the response body" do
      expect(response.body).to include('Welcome to the Blog App!')
    end
  end

  describe 'GET /:id' do
    let!(:user) { User.create(name: 'Salwa Ballouti') }
    before(:example) { get user_path(user) }

    it 'Success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'user' template" do
      expect(response).to render_template('users/show')
    end

    it "includes the user's name in the response body" do
      expect(response.body).to include(user.name)
    end
  end
end
