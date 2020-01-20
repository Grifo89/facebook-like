# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

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
    @post = Post.find(params[:id])
    Like.create(user_id: current_user.id, post_id: @post.id, status: true)
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
