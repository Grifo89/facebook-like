# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id)
  end

  def send_friend_request
    current_user.friendships.create(receiver_id: params[:id])
    redirect_to root_path
    flash[:success] = 'friendship request sent'
  end

  def send_friend_response
    user = User.find(params[:id])
    current_user.confirm_friend(user)

    redirect_to root_path
    flash[:success] = 'Friend accepted'
  end
end
