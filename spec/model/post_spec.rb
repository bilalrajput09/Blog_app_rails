require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'Should return false for invalid title' do
    post = Post.new(id: 1, author_id: 1, title: ' ', text: 'This is the first post', comments_counter: 0,
                    likes_counter: 0, created_at: '2020-09-09', updated_at: '2020-09-09')

    expect(post.save).to eq(false)
  end

  it 'should return false for negative input of comments_counter' do
    post = Post.new(id: 1, author_id: 1, title: 'First post', text: 'This is the first post', comments_counter: -1,
                    likes_counter: 0, created_at: '2020-09-09', updated_at: '2020-09-09')

    expect(post.valid?).to eq(false)
  end

  it 'should return false for negative input of likes_counter' do
    post = Post.new(id: 1, author_id: 1, title: 'First post', text: 'This is the first post', comments_counter: 0,
                    likes_counter: 1, created_at: '2020-09-09', updated_at: '2020-09-09')

    expect(post.valid?).to eq(false)
  end

  it 'Should increment the counter' do
    user = User.new(name: 'Bilal', photo: 'http://photo.com', bio: 'I am bilal ahmed', posts_counter: 0)
    user.save
    post = Post.new(author_id: user.id, title: 'First post', text: 'This is the first post', comments_counter: 0,
                    likes_counter: 1)
    expect(post.user.posts_counter).to eq(0)
    post.save
    expect(post.user.posts_counter).to eq(1)
    expect(post.valid?).to eq(true)
    post.increment_posts_counter
    expect(post.user.posts_counter).to eq(2)
  end

  it 'Should return last 5 comments' do
    post = Post.new(author_id: 1, title: 'First post', text: 'This is the first post', comments_counter: 0,
                    likes_counter: 1)
    post.save
    comment = Comment.new(id: 1, author_id: 1, post_id: post.id, text: 'Hi tom')
    post.comments << comment
    post.comments << comment
    post.comments << comment
    post.comments << comment
    post.comments << comment
    post.comments << comment

    expect(post.return_5_recent_comments).to eq(post.comments.last(5).reverse)
  end
end
