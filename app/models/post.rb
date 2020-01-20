# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :likes
  has_many :liking_users, through: :likes
  belongs_to :user
  validates :body, presence: true,
                   length: { minimum: 5 }
end
