# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @post = Post.new

    @user_posts = current_user.posts
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

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
