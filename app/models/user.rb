# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, -> { order 'created_at DESC' }, dependent: :destroy
  has_many :likes
  has_many :liked_posts, through: :likes
  has_many :comments
  has_many :commented_posts, through: :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
