# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :liking_user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :liked_post, class_name: 'Post', foreign_key: 'post_id'
end
