# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'FriendRequests', type: :feature do
  let(:user1) { User.create(email: 'edem@gmail.com', password: '111111') }
  let(:user2) { User.create(email: 'albert@gmail.com', password: '111111') }
  before do
    sign_in(user1)
  end

  it ' send a friend request ' do
    visit users_path
    click_on 'Send Request'
    expect(page).to have_content 'User request sent!'
  end
end
