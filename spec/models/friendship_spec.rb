# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user1) { User.create(email: 'userA@email.com', password: 'secret') }
  let(:user2) { User.create(email: 'userB@email.com', password: 'secret') }
  describe 'When a user sends a friend request' do
    it "The receiver isn't allowed to send a friend request to the same sender" do
      user1.friendships.create(receiver_id: user2.id, status: true)
      inverse_friendships = user2.friendships.create(receiver_id: user1.id)
      expect(inverse_friendships.valid?).to be false
    end
  end
end
