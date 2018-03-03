require 'rails_helper'

RSpec.describe EthermineGeneralInfoPresenter do
 ether = EthermineGeneralInfoPresenter.new

 it 'if the elements are initialized' do
   expect(ether).to_not eq nil
 end

 it 'responds to pool_stats method' do
   expect(ether.pool_stats.class).to eq Hash
 end

 it 'responds to price method' do
   expect(ether.price['usd'].class).to eq Float
   expect(ether.price['btc'].class).to eq Float
 end

 it 'responds network method' do
   expect(ether.network).to_not eq EtherClient::Model::PoolNetwork
 end
end
