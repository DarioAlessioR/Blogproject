class PostsController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource

  def index
    @user = User.includes(:posts).find(params[:user_id])
    @posts = @user.posts
    # @comments = Comment.includes(:author)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.includes(:author).where(posts_id: params[:id])
    # @comments = Comment.where(post_id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(strong_params)

    if @post.save
      flash[:success] = 'Post saved!'
      redirect_to user_path(current_user.id)
    else
      flash.now[:error] = 'Please fill all fields'
      render :new, status: 422
    end
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to user_path(current_user)
    flash[:success] = 'The post was successfully destroyed.'
  end

  private

  def strong_params
    params.require(:post).permit(:title, :text)
  end
end
