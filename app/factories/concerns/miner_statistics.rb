class MinerStatistics
  include EthermineAttrs
  def initialize(statistics)
    @attrs = [:valid_shares, :invalid_shares, :stale_shares, :active_workers, :unconfirmed, :coins_per_min, :time, :last_seen, :reported_hashrate, :average_hashrate, :current_hashrate, :unpaid, :usd_per_min, :btc_per_min]
    @args = statistics
  end
end
