module MockMinerFactory

  def mock_miner_factory
    allow(EtherClient::Api::MinerApi)
      .to receive(:new)
      .and_return(instance_double('EtherClient::Api::MinerApi'))
    allow(MinerFactory)
      .to receive(:new).and_return(miner_instance)
  end

  def miner_instance
    miner_factory = instance_double(
      'MinerFactory',
      settings: 1,
      statistics: 2,
      payouts: double(
        'payout',
        paid_on: 1,
        start: 2,
        end: 3,
        amount: 4,
        tx_hash: 5
      ),
      histories: double(
        'history',
        time: 1,
        reported_hashrate: 2,
        average_hashrate: 4,
        current_hashrate: 5,
        valid_shares: 8,
        stale_shares: 7,
        invalid_shares: 6,
        active_workers: 3
      ),
      rounds: double(
        'rounds',
        amount: 1,
        block: 2
      )
      )
  end
end
