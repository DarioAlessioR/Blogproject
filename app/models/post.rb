class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save: update_post_counter

  def recent_five_comments
    Comment.last(5)
  end

  def update_post_counter
    author.increment!(:post_counter)
  end
end
