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

  let(:first_comment) do
    Comment.new(author_id: person2.id, post: first_post, text: 'This is the first comment on first post')
  end

  let(:second_comment) do
    Comment.new(author_id: person2.id, post: first_post, text: 'This is the second comment on first post')
  end

  let(:third_comment) do
    Comment.new(author_id: person2.id, post: first_post, text: 'This is the third comment on first post')
  end

  before do
    person1.save!
    person2.save!
    first_post.save!
    second_post.save!
    first_comment.save!
    second_comment.save!
    third_comment.save!
  end
  it "Will check if the user's profile picture displays" do
    visit "/users/#{person1.id}/posts"
    expect(page).to have_css("img##{person1.id}")
  end

  it 'Will check if the username of user displays' do
    visit "/users/#{person1.id}/posts"
    expect(page).to have_content(person1.name)
  end

  it 'Will check the number of posts visible for user' do
    visit "/users/#{person1.id}/posts"
    expect(page).to have_content(person1.posts_counter)
  end

  it 'Will check if the posts title displays' do
    visit "/users/#{person1.id}/posts"
    expect(page).to have_content(first_post.title)
  end

  it 'Will check if the post body displays' do
    visit "/users/#{person1.id}/posts"
    expect(page).to have_content(first_post.text)
  end

  it 'Will check if the first comment displays' do
    visit "/users/#{person1.id}/posts"
    id = first_comment.id
    first_comment = find("#comment-#{id}", wait: 10)
    expect(page).to have_content(first_comment.text)
  end

  it 'Will check if the comments counter visible' do
    visit "/users/#{person1.id}/posts"
    expect(page).to have_content(first_post.comments_counter)
  end

  it 'Will check if the likes counter visible' do
    visit "/users/#{person1.id}/posts"
    expect(page).to have_content(first_post.likes_counter)
  end

  it "Will check when I click on user's post it redirects to post's show page" do
      visit "/users/#{person1.id}/posts"
      second_post_link = find('.post_item', match: :first, wait: 10)
      second_post_link.click
      expect(page).to have_current_path("#{Capybara.app_host}/users/#{person1.id}/posts/#{second_post.id}")
  end

  describe 'Post show page' do
    it "Will check if the post's title visible" do
      visit "/users/#{person1.id}/posts/#{first_post.id}"
      expect(page).to have_content(first_post.title)
    end

    it 'Will check if the name of author exist on the page' do
      visit "/users/#{person1.id}/posts/#{first_post.id}"
      expect(page).to have_content(first_post.user.name)
    end

    it 'Will check how many comments the post has' do
      visit "/users/#{person1.id}/posts/#{first_post.id}"
      expect(page).to have_content(first_post.comments_counter)
    end

    it 'Will check how many likes the post has' do
      visit "/users/#{person1.id}/posts/#{first_post.id}"
      expect(page).to have_content(first_post.likes_counter)
    end

    it 'Will check the post body visible' do
      visit "/users/#{person1.id}/posts/#{first_post.id}"
      expect(page).to have_content(first_post.text)
    end

    it 'Will check the username of each comment visible and all comments show up' do
      visit "/users/#{person1.id}/posts/#{first_post.id}"
      first_post.comments.each do |comment|
        expect(page).to have_content(comment.user.name)
      end
    end
  end
end
