# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
end
