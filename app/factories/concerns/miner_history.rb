class MinerHistory
  include EthermineAttrs
  def initialize(history)
    @attrs = [:time, :reported_hashrate, :average_hashrate, :current_hashrate, :valid_shares, :invalid_shares, :stale_shares, :active_workers]
    @args = history
  end
end
