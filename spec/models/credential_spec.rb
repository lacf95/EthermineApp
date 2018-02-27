require 'rails_helper'

RSpec.describe Credential do
  describe 'the credential params' do
    let(:user){ create(:user) }
    let(:credential){ build(:credential) }
    it 'is valid' do
      credential.user = user
      expect(credential.valid?).to eq true
    end
  end

  describe 'wrong paassword' do
    let(:user){ create(:user) }
    let(:credential){ build(:credential) }

    it 'user values are valid' do
      credential.password = '321'
      credential.user = user
      expect(credential.valid?).to eq false
    end
  end
end
