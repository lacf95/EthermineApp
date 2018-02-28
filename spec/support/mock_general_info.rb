module MockGeneralInfo

  def mock_general_info
    gen_info = instance_double(
      'EthermineGeneralInfoPresenter',
      price: {},
      pool_stats: {},
      network: double(
        'network',
        time: nil,
        block_time: nil,
        difficulty: nil,
        hashrate: nil,
        usd: nil,
        btc: nil
      )
    )
    allow(EthermineGeneralInfoPresenter)
      .to receive(:new).and_return(gen_info)
  end
end
