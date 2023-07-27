class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user, foreign_key: 'author_id', class_name: 'User'

  after_create :increment_posts_counter
  after_destroy :decrement_posts_counter

  def increment_posts_counter
    user.increment!(:posts_counter)
  end

  def decrement_posts_counter
    user.decrement!(:posts_counter)
  end

  def return_5_recent_comments
    comments.last(5).reverse
  end
end
