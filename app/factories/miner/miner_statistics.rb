class MinerStatistics
  include EthermineConvertions
  def initialize(statistics)
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

  def valid_shares
    @statistics.try(:valid_shares)
  end

  def invalid_shares
    @statistics.try(:invalid_shares)
  end

  def stale_shares
    @statistics.try(:stale_shares)
  end

  def active_workers
    @statistics.try(:active_workers)
  end

  def unpaid
    to_eth(@statistics.try(:unpaid))
  end

  def unconfirmed
    @statistics.try(:unconfirmed) == nil ? 'N/V' : @statistics.try(:unconfirmed)
  end

  def coins_per_min
    @statistics.try(:coins_per_min)
  end

  def usd_per_min
    "#{@statistics.try(:usd_per_min)} USD"
  end

  def btc_per_min
    "#{@statistics.try(:btc_per_min)} BTC"
  end
end
