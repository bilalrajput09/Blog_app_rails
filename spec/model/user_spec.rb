require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(id: 1, name: 'Bilal', photo: 'http://photo.com', bio: 'I am bilal ahmed', posts_counter: 0, created_at: '2020-09-09', updated_at: '2020-09-09') }

  let(:post) do
    Post.new(id: 1, author_id: 1, title: 'First post', text: 'This is the first post', comments_counter: 0,
             likes_counter: 0, created_at: '2020-09-09', updated_at: '2020-09-09')
  end

  it 'Should add posts to posts array' do
    expect(subject.posts.length).to eq(0)
    subject.posts << post
    expect(subject.posts.length).to eq(1)
  end

  it 'Should return recent 3 posts' do
    subject.posts << post
    subject.posts << post
    subject.posts << post
    subject.posts << post
    expect(subject.recent_3_posts).to eq(subject.posts.last(3).reverse)
  end

  it 'should return false for negative input of posts_counter' do
    user = User.new(id: 1, name: 'Bilal', photo: 'http://photo.com', bio: 'I am bilal ahmed', posts_counter: -1,
                    created_at: '2020-09-09', updated_at: '2020-09-09')

    expect(user.valid?).to eq(false)
  end

  it 'should return false for string input of posts_counter' do
    user = User.new(id: 1, name: 'Bilal', photo: 'http://photo.com', bio: 'I am bilal ahmed', posts_counter: 'zz',
                    created_at: '2020-09-09', updated_at: '2020-09-09')

    expect(user.valid?).to eq(false)
  end
end
