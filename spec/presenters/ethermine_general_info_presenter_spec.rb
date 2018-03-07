require 'rails_helper'

RSpec.describe EthermineGeneralInfoPresenter do
  ether = EthermineGeneralInfoPresenter.new

  it 'the elements are initialized' do
    expect(ether).to_not be_nil
  end

  it 'responds to pool_stats method' do
    expect(ether.pool_stats).to be_an_instance_of Hash
  end

  it 'responds to price method' do
    expect(ether.price['usd']).to be_an_instance_of Float
    expect(ether.price['btc']).to be_an_instance_of Float
  end

  it 'responds network method' do
    expect(ether.network).to be_an_instance_of EtherClient::Model::PoolNetwork
  end
end
