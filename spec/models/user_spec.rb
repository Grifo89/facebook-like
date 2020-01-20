# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:posts) { Post.new(body: 'post content') }
  subject { described_class.new(email: 'edem@gmail.com', password: 'secret') }
  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'has minimum email of 5' do
      subject.email = 'a@g'

      expect(subject).to be_valid
    end
  end

  describe 'Associations ' do
    it 'has one or more posts' do
      Post.create(body: 'test 1 is here', user: subject)
      Post.create(body: 'test 2 is here', user: subject)

      expect(subject.posts.count).to eq 2
    end
  end
end
