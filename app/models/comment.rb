class Comment < ApplicationRecord
  belongs_to :commenter , class_name: 'User', foreign_key: 'user_id'
  belongs_to :commented_post, class_name: 'Post', foreign_key: 'post_id'
end
