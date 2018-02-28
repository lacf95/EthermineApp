require 'rails_helper'

RSpec.describe 'Dashboard', type: :feature do
  include MockGeneralInfo
  include MockEtherClient
  include Login

  let(:password){'123456'}
  let(:user){ create :user, password: password, active: true }
  let!(:addresses){ create_list :address, 3, user: user }
  let!(:eth_client){ mock_statistics }
  let!(:gen_info){ mock_general_info }

  before do
    log_in(user)
  end

  scenario 'Show general information and my addresses' do
    visit '/users/me'

    within '#main' do
      addresses.each do |address|
        expect(page.body).to include address.alias
      end
    end

    within '#sidebar' do
      expect(page.body).to include gen_info.network.time
      expect(page.body).to include gen_info.price['btc']
      expect(page.body).to include gen_info.pool_stats['hashRate']
    end
  end
end
