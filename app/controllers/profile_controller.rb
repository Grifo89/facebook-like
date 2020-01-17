class ProfileController < ApplicationController
  before_action :require_login
  def index
    @user = User.find(current_user.id)
    @post = Post.new

    @user_posts = current_user.posts
  end

    
end
