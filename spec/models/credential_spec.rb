require 'rails_helper'

RSpec.describe Credential do
  let(:user){ create(:user) }
  let(:credential){ build(:credential) }

  context 'valid values' do
    it 'is valid' do
      credential.user = user
      expect(credential.valid?).to eq true
    end
  end

  context 'invalid password' do
    it 'user values are valid' do
      credential.password = '321'
      credential.user = user
      expect(credential.valid?).to eq false
    end
  end
end
