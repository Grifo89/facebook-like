# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sign up', type: :feature do
  scenario 'user is gonna signin' do
    visit new_user_registration_path
    fill_in 'user[email]', with: 'example@email.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    click_button('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully')
  end
end
