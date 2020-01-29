# frozen_string_literal: true

module ApplicationHelper
  def request_count
    current_user.friend_requests.count
  end
end
