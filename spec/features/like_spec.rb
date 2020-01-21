# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Likes', type: :feature do
  let(:user) { User.create(email: 'edem@gmail.com', password: '111111') }
  before do
    sign_in(user)
    post = user.posts.create(body: 'My post')
  end

  it 'likes a post' do
    visit root_path
    click_on('like')
    expect(page).to have_content 'Post liked'
  end
end
