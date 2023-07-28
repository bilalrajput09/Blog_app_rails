require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'Should increment the counter' do
    user = User.new(name: 'Bilal', photo: 'http://photo.com', bio: 'I am bilal ahmed', posts_counter: 0)
    user.save
    post = Post.new(author_id: user.id, title: 'First post', text: 'This is the first post', comments_counter: 0,
                    likes_counter: 0)
    post.save
    like = Like.new(author_id: user.id, post_id: post.id)
    like.save
    expect(like.post.likes_counter).to eq(1)
    like.increment_likes_counter
    expect(like.post.likes_counter).to eq(2)
  end
end
