# frozen_string_literal: true

class Friendship < ApplicationRecord
  validates :user_id, presence: true
  validates :receiver_id, presence: true
  validate :users_are_not_already_friends
  belongs_to :user
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  def users_are_not_already_friends
    if Friendship.where(user_id: self.user_id, receiver_id: self.receiver_id) ||
      Friendship.where(user_id: self.receiver_id, friend_id: self.user_id)
      self.errors.add(:user_id, 'Already friends!')
    end
  end
end
