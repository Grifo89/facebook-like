# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :likes
  has_many :liking_users, through: :likes
  has_many :comments
  has_many :commenters, through: :comments
  belongs_to :user
  validates :body, presence: true,
                   length: { minimum: 5 }
end
