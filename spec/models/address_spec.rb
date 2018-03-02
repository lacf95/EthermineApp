require 'rails_helper'

RSpec.describe Address do
  describe 'Address validation' do
    let(:address){ build(:address) }

    it 'Address has less than 50 chars' do
      address.address *= 5
      expect(address.valid?).to eql false
      expect(address.errors[:address]).to include 'is too long (maximum is 50 characters)'
    end

    it 'Alias has less than 50 chars' do
      address.alias *= 10
      expect(address.valid?).to eql false
      expect(address.errors[:alias]).to include 'is too long (maximum is 40 characters)'
    end

    it 'Precence of user id' do
      address.user_id = nil
      expect(address.valid?).to eql false
      expect(address.errors[:user_id]).to include 'can\'t be blank'
    end
  end
end
