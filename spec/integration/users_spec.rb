require 'rails_helper'

RSpec.describe User, type: :feature do
  let(:person1) do
    User.new(name: 'Bilal', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am full stack developer',
             posts_counter: 0)
  end

  let(:person2) do
    User.new(name: 'Ashna', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am full stack developer',
             posts_counter: 0)
  end

  let(:first_post) do
    Post.new(author_id: person1.id, title: 'Hello this is the first post', text: 'Most important description',
             likes_counter: 0, comments_counter: 0)
  end

  let(:second_post) do
    Post.new(author_id: person1.id, title: 'Hello-2 this is the second post', text: 'Most important description-2',
             likes_counter: 0, comments_counter: 0)
  end

  before do
    person1.save!
    person2.save!
    first_post.save!
    second_post.save!
  end

  it 'Checks the name of users' do
    visit root_path
    expect(page).to have_content(person1.name)
  end

  it 'Checks for the number of posts each user has' do
    visit root_path
    expect(page).to have_content(person1.posts.count)
  end

  it 'Checks if the profile image successfully rendered for each user' do
    visit root_path
    expect(page).to have_css("img##{person1.id}")
  end

  it "Checks if we click on the user I am redirected to user's show page" do
    visit root_path
    first_link = find("#link-#{person1.id}")
    first_link.click
    expect(page).to have_current_path("#{Capybara.app_host}/users/#{person1.id}")
  end

  describe 'User show page' do
    it "Will check if the user's profile picture visible" do
      visit "/users/#{person1.id}"
      expect(page).to have_css("img##{person1.id}")
    end

    it 'Will make sure the username is visible' do
      visit "/users/#{person1.id}"
      expect(page).to have_content(person1.name)
    end

    it 'Will check the number of posts' do
      visit "/users/#{person1.id}"
      expect(page).to have_content(person1.posts.count)
    end

    it 'Will check the persons bio is visible' do
      visit "/users/#{person1.id}"
      expect(page).to have_content(person1.bio)
    end

    it 'will check users first 3 posts visible' do
      visit "/users/#{person2.id}"
      person2.posts.first(3).each do |post|
        expect(page).to have_content(post.title)
      end
    end

    it "Will check the users's post button visible" do
      visit "/users/#{person2.id}"
      expect(page).to have_content('See all posts')
    end

    it "Will check when I click on user's post it redirects to post's show page" do
      visit "/users/#{person1.id}"
      first_post_link = find('.post_item', match: :first, wait: 10)
      first_post_link.click
      expect(page).to have_current_path("#{Capybara.app_host}/users/#{person1.id}/posts/#{second_post.id}")
    end

    it "Will take me to the user's posts index page" do
      visit "/users/#{person1.id}"
      button_all_posts = find('a', text: 'See all posts')
      button_all_posts.click
      expect(page).to have_current_path("#{Capybara.app_host}/users/#{person1.id}/posts")
    end
  end
end
