require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(name: 'Dario')

  post1 = Post.new(title: '', text: 'Testing', author: user)

  it 'Tests a post without title is not valid' do
    expect(post1).not_to be_valid
  end

  post2 = Post.new(title: 'A', text: 'Testing', author: user)

  it 'Tests a post with 1 character title is not valid' do
    expect(post2).not_to be_valid
  end

  post3 = Post.new(title: 'Abcde', text: 'Testing', author: user)

  it 'Tests a post with 5 character title is valid' do
    expect(post3).to be_valid
  end

  post4 = Post.new(title: 'Abcde', text: 'Testing', author: user)

  it 'Tests if comments_counter = 0' do
    expect(post4.comments_counter).to be_eql 0
  end

  post5 = Post.new(title: 'Abcde', text: 'Testing', author: user, comments_counter: 0.2)

  it 'Tests if comments_counter = 0.2 is invalid' do
    expect(post5).not_to be_valid
  end

  post6 = Post.new(title: 'Abcde', text: 'Testing', author: user)

  it 'Tests if likes_counter = 0' do
    expect(post6.likes_counter).to be_eql 0
  end

  post7 = Post.new(title: 'Abcde', text: 'Testing', author: user, likes_counter: 0.2)

  it 'Tests if likes_counter = 0.2 is invalid' do
    expect(post7).not_to be_valid
  end

  it 'Tests method recent_five_comments return a maximun of 5 comments' do
    user3 = User.new(name: 'Pepeillo', post_counter: 0)
    user3.save
    post9 = Post.new(title: 'Abcdefg', text: 'Testing', author: user3, comments_counter: 0,
    likes_counter: 0)
    post9.save

    6.times do
      Comment.new(author: user3, post: post9, text: 'Testing')
    end

    expect(post9.recent_five_comments.length).to be <= 5
  end




end
