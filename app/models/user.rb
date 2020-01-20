# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, -> { order 'created_at DESC' }, dependent: :destroy
  has_many :likes
  has_many :liked_post, through: :likes, source: 'post_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
