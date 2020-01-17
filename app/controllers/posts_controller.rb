class PostsController < ApplicationController
  before_action :require_login

  def create
    current_user.posts.create(body: post_params[:body])
    flash[:success] = "Your post has been created!"
    redirect_to root_url
  end

  private
    def post_params
      params.require(:post).permit(:body)
    end

   
end
