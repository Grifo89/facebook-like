# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, -> { order 'created_at DESC' }, dependent: :destroy
  has_many :likes
  has_many :liked_posts, :through => :likes
  has_many :comments
  has_many :commented_posts, :through => :comments
  has_many :friendships, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'receiver_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def friends 
    friends_array = friendships.map{|friendship| friendship.receiver if friendship.status}
    friends_array + inverse_friendships.map{|friendship| friendship.user if friendship.status}
    friends_array.compact
  end

  # Users who have yet to confirme friend requests
  def pending_friends
    friendships.map{|friendship| friendship.receiver if !friendship.status}.compact
  end
  
  # Users who have requested to be friends
  def friend_requests
    inverse_friendships.map{|friendship| friendship.user if !friendship.status}.compact
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find{|friendship| friendship.user == user}
    friendship.status = true
    friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end
end
