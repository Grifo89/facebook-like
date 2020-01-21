# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  let(:user) { User.create(email: 'edem@gmail.com', password: '111111') }
  before do
    sign_in(user)
    post = user.posts.create(body: 'My post')
  end

  it 'can comment on post' do
    visit root_path
    # comment = post.comments.create({:body => 'I commented here!'})
    fill_in 'comment', with: 'my comment!'
    click_on 'Comment'
    expect(page).to have_content 'Post commented'
  end
end
