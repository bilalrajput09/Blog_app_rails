require "rails_helper"

RSpec.describe User, type: :feature do
    let(:person1) do
        User.new(name: "Bilal", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "I am full stack developer", posts_counter: 0)
    end

    let(:first_post) do
        Post.new(author_id: person1.id, title: "Hello this is the first post", text: "Most important description", likes_counter: 0, comments_counter: 0)
    end

    let(:second_post) do
        Post.new(author_id: person1.id, title: "Hello this is the first post", text: "Most important description", likes_counter: 0, comments_counter: 0)
    end

    let(:third_post) do
        Post.new(author_id: person1.id, title: "Hello this is the first post", text: "Most important description", likes_counter: 0, comments_counter: 0)
    end

    let(:fourth_post) do
        Post.new(author_id: person1.id, title: "Hello this is the first post", text: "Most important description", likes_counter: 0, comments_counter: 0)
    end

    before do
        person1.save!
        first_post.save!
        second_post.save!
        third_post.save!
        fourth_post.save!
    end

    it "Will check the pagination" do
        visit "/users/#{person1.id}/posts"
        expect(page).to have_selector('.pagination')
    end
end
