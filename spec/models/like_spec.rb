# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:liking_user) { User.create(email: 'edem@gmail.com', password: '111111') }
  let(:liked_post) { user.posts.create(body: 'My post') }
  subject { described_class.new(user_id: user.id, post_id: post.id, status: true) }

  describe ' Associations' do
    it 'belongs to a post' do
      assoc = described_class.reflect_on_association(:liked_post)
      expect(assoc.macro).to eq :belongs_to
    end
    it 'belongs to a user' do
      assoc = described_class.reflect_on_association(:liking_user)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
