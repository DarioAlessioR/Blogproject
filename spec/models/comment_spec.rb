require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(name: 'Dario')
  post = Post.new(title: 'example', text: 'example', author: user)
  comment = Comment.new(author: user, post: post)

  it 'new comment is valid' do
    expect(comment).to be_valid
  end
end
