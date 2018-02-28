module MockEtherClient
  def mock_statistics
    statistics = double(
      'statistics',
      usd_per_min:      Random.new.rand(1000),
      btc_per_min:      Random.new.rand(1000),
      current_hashrate: Random.new.rand(1000)
    )
    eth_client = instance_double(
      'EtherClient',
      miner: double('miner', statistics: statistics, miner_id: 1
      )
    )

    allow_any_instance_of(EtherClient)
      .to receive(:miner).and_return(eth_client.miner)

    eth_client
  end
end
