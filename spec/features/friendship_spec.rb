# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Friendships', type: :feature do
  let(:user) { User.create(email: 'edem@gmail.com', password: '111111') }
  let(:user2) { User.create(email: 'john@gmail.com', password: '111111') }
  before do
    sign_in(user2)
  end
  scenario 'User logs in for the first time and has no friend request' do
    visit root_path
    expect(page).to have_content 'You have 0 requests'
  end

  # scenario "User visits the list of all users and sends friend request" do
  #   visit users_path
  #   # click_on 'Send Chapo'
  #   expect(page).to have_content "edem@gmail.com"
  # end
end
