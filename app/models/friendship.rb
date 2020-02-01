# frozen_string_literal: true

class Friendship < ApplicationRecord
  validates :user_id, presence: true
  validates :receiver_id, presence: true
  validate :users_are_not_already_friends
  belongs_to :user, autosave: true
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  def users_are_not_already_friends
    if Friendship.where(user_id: user_id, receiver_id: receiver_id, status: true).any?
      errors.add(:user_id, 'Already friends!')
      false
    else
      true
    end
  end
end
