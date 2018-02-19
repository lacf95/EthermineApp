class MinerStatistics
  include EthermineConvertions
  def initialize(miner)
    @miner = miner
  end

  def time
    to_date(@miner.try(:time))
  end

  def last_seen
    to_date(@miner.try(:last_seen))
  end

  def reported_hashrate
    to_ghs(@miner.try(:reported_hashrate))
  end

  def average_hashrate
    to_ghs(@miner.try(:average_hashrate))
  end

  def current_hashrate
    to_ghs(@miner.try(:current_hashrate))
  end

  def valid_shares
    @miner.try(:valid_shares)
  end

  def invalid_shares
    @miner.try(:invalid_shares)
  end

  def stale_shares
    @miner.try(:stale_shares)
  end

  def active_workers
    @miner.try(:active_workers)
  end

  def unpaid
    to_eth(@miner.try(:unpaid))
  end

  def unconfirmed
    @miner.try(:unconfirmed) == nil ? 'N/V' : @miner.try(:unconfirmed)
  end

  def coins_per_min
    @miner.try(:coins_per_min)
  end

  def usd_per_min
    "#{@miner.try(:usd_per_min)} USD"
  end

  def btc_per_min
    "#{@miner.try(:btc_per_min)} BTC"
  end
end
