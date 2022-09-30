require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'Dario')
  post = Post.new(title: 'example', text: 'example', author: user)
  like = Like.new(author: user, post:)

  it 'new like is valid' do
    expect(like).to be_valid
  end
end
