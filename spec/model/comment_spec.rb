require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'Should increment the counter' do
    user = User.new(name: 'Bilal', photo: 'http://photo.com', bio: 'I am bilal ahmed', posts_counter: 0)
    user.save
    post = Post.new(author_id: user.id, title: 'First post', text: 'This is the first post', comments_counter: 0,
                    likes_counter: 0)
    post.save
    comment = Comment.new(author_id: user.id, post_id: post.id)
    comment.save
    expect(comment.post.comments_counter).to eq(1)
    comment.increment_comments_counter
    expect(comment.post.comments_counter).to eq(2)
  end
end
