require 'rails_helper'

RSpec.describe Address do
  describe 'Address validation' do
    let(:user){ create(:user) }
    let(:address){ create(:address, user: user) }

    it 'Address has less than 50 chars' do
      address.address *= 5
      expect(address.valid?).to eql false
      expect(address.errors[:address]).to_not be_empty
    end

    it 'Alias has less than 50 chars' do
      address.alias *= 10
      expect(address.valid?).to eql false
      expect(address.errors[:alias]).to_not be_empty
    end

    it 'Precence of user id' do
      address.user_id = nil
      expect(address.valid?).to eql false
      expect(address.errors[:user_id]).to_not be_empty
    end
  end
end
