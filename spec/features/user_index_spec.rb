require 'rails_helper'
RSpec.describe 'User index page', type: :feature do
  let!(:user1) { User.create(name: 'Salwa', bio: 'Developer', photo: 'photo.jpg', posts_counter: 4) }
  let!(:user2) { User.create(name: 'Anas', bio: 'Pentester', photo: 'photo.jpg', posts_counter: 10) }
  before do
    visit users_path
  end
  describe 'Page content' do
    it 'Display all usernames' do
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user2.name)
    end
    it 'Display number of posts for each user' do
      expect(page).to have_content("Posts: #{user1.posts.count}")
      expect(page).to have_content("Posts: #{user2.posts.count}")
    end
  end
  describe 'Check each user' do
    it "Redirect to user1's show page" do
      click_link("user-#{user1.id}")
      expect(current_path).to eq user_path(user1)
    end
    it "Redirect to user2's show page" do
      click_link user2.name
      expect(current_path).to eq user_path(user2)
    end
  end
end
