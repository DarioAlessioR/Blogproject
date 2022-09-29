require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'Dario')
  user2 = User.new(name:'')

  it 'Tests to prove user is valid' do
  expect(user).to be_valid
  end

  it 'Tests if name = user name' do
    expect(user.name).to be_eql 'Dario'
  end

  it 'Tests to prove user without name is not valid' do
    expect(user2).not_to be_valid
  end

  it 'Tests if post_counter = 0' do
    expect(user.post_counter).to be_eql 0
  end

  it 'Tests if post_counter = 0.1 is invalid' do
    user.post_counter = 0.1
    expect(user).not_to be_valid
  end

  it 'Tests method last_three_posts return a maximun of 3 posts' do
    user3 = User.new(name: 'Pepe')
    user3.save
    
    5.times do
      Post.new(title: 'AAA', text: 'Testing', author: user3).save
    end

    expect(user3.last_three_posts.length).to be_eql 3
  end
end
