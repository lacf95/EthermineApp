module MockGeneralInfo

  def mock_general_info
    gen_info = instance_double(
      'EthermineGeneralInfoPresenter',
      price: { 'btc' => Random.new.rand(100).to_s},
      pool_stats: { 'hashRate' => Random.new.rand(100).to_s},
      network: double(
        'network',
        time: Random.new.rand(100).to_s,
        block_time: nil,
        difficulty: nil,
        hashrate: nil,
        usd: nil,
        btc: nil
      )
    )
    allow(EthermineGeneralInfoPresenter)
      .to receive(:new).and_return(gen_info)
    gen_info
  end
end
