class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id, class_name: 'User'
  belongs_to :post

  after_create :increment_comments_counter
  after_destroy :decrement_comments_counter

  def increment_comments_counter
    post.increment!(:comments_counter)
  end

  def decrement_comments_counter
    post.decrement!(:comments_counter)
  end
end
