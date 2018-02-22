class MinerStatistics
  include EthermineConvertions
  include EthermineAttrs

  def initialize(statistics)
    @attrs = [:valid_shares, :invalid_shares, :stale_shares, :active_workers, :unconfirmed, :coins_per_min]
    @args = statistics
    @statistics = statistics
  end
  
  def time
    to_date(@statistics.try(:time))
  end

  def last_seen
    to_date(@statistics.try(:last_seen))
  end

  def reported_hashrate
    to_ghs(@statistics.try(:reported_hashrate))
  end

  def average_hashrate
    to_ghs(@statistics.try(:average_hashrate))
  end

  def current_hashrate
    to_ghs(@statistics.try(:current_hashrate))
  end


  def unpaid
    to_eth(@statistics.try(:unpaid))
  end

  def usd_per_min
    "#{@statistics.try(:usd_per_min)} USD"
  end

  def btc_per_min
    "#{@statistics.try(:btc_per_min)} BTC"
  end
end
