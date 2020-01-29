# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @post = Post.new
    # @user_posts = Post.all
    # Get the posts of 
    friends =[]
    @user.friends.map do |v|
      friends << v.id
    end
    friends << current_user.id
    @user_posts = Post.where(user_id: friends)
    @requests = current_user.friend_requests
  end

  def create
    @post = current_user.posts.new(body: post_params[:body])
    if @post.save
      flash[:success] = 'Your post has been created!'
      redirect_to root_url
    else
      @user = current_user
      @user_posts = @user.posts
      render 'profile/index'
    end
  end

  def like
    @post = Post.find_by(id: params[:post_id])
    Like.create(user_id: current_user.id, post_id: @post.id, status: true)
    flash[:success] = 'Post liked'
    redirect_to root_path
    # puts @post
  end

  def comment
    @post = Post.find_by(id: params[:post_id])
    Comment.create(user_id: current_user.id, post_id: @post.id, body: params[:comment])
    flash[:success] = 'Post commented'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
