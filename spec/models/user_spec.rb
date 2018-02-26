require 'rails_helper'

RSpec.describe User do
  describe 'email validation' do
    let(:user){  build(:user) }

    it 'doesn\'t return errors with a valid email' do
      expect(user.errors[:email]).to be_empty
    end

    it 'returns invalid error when the email is not valid' do
      user.email = 'ces@asd'
      expect(user.valid?).to eq false
      expect(user.errors[:email]).to include 'is invalid'
    end
  end

  describe 'full name method' do
    let(:user){  build(:user) }

    it 'returns the user\'s full name' do
      expect(user.full_name).to eq "#{user.first_name} #{user.last_name}"
    end
  end

  describe 'change token method' do
    let(:user){ create(:user) }

    it 'updates the token' do
      previous_token = user.token
      expect(user.change_token).to be true
      expect(user.token).to_not eq previous_token
    end
  end
end
