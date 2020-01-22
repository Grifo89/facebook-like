# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def send_friend_request
    current_user.friendships.create(receiver_id: params[:id])
    redirect_to root_path
    flash[:success] = "friendship request sent"
  end
end
