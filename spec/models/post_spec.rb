# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new }
  let(:likes) { Like.new }
  let(:comments) { Comment.new }
  subject { described_class.new(body: 'this is the test', user: user) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      user.email = 'edem@gmail.com'
      expect(Post.new(body: 'The body', user: user)).to be_valid
    end
    it 'is not valid without a body' do
      subject.body = nil
      expect(subject).to_not be_valid
    end

    it ' should have a least 5 character' do
      subject.body = 'a' * 4
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'belongs to a user' do
      assoc = described_class.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
    
    it "has one or more likes" do
      assoc = described_class.reflect_on_association(:likes)
      expect(assoc.macro).to eq :has_many
    end

    it "has one or more comments" do 
      assoc = described_class.reflect_on_association(:comments)
      expect(assoc.macro).to eq :has_many
    end
  end
end
