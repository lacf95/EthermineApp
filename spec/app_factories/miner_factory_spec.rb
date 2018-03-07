require 'rails_helper'

RSpec.describe MinerFactory do
  let(:user){ create :user }
  let(:address){ create :address, user: user }

  before do
    client = EtherClient.new(address.address)
    @miner = MinerFactory.new(client.miner)
  end

  context 'Miner Factory works' do

    it 'Get succesfully the client' do
      expect(@miner).to_not eq nil
    end

    it 'Has payouts inside' do
      expect(@miner.payouts).to_not eq nil
    end

    it 'Has rounds inside' do
      expect(@miner.rounds).to_not eq nil
    end

    it 'Has history inside' do
      expect(@miner.histories).to_not eq nil
    end

    it 'Has statistics inside' do
      expect(@miner.statistics).to_not eq nil
    end

    it 'Has settings inside' do
      expect(@miner.settings).to_not eq nil
    end

    it 'Has statistics information' do
      expect(@miner.statistics.time).to_not eq nil
    end

    it 'Hasn\'t information' do
      expect { @miner.settings.emails }.to raise_error(NoMethodError)
    end

    it 'Convert unix timestamp to date' do
      expect(1.to_date).to eq 'December 31, 1969 18:00'
    end

    it 'Convert number to ghs' do
      expect(1_000_000_000.to_ghs).to include '1.0 GH/s'
    end

    it 'Convert number to eth' do
      expect(1_000_000_000_000_000_000.to_eth).to include '1.0 ETH'
    end
  end
end
