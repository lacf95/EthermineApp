class MinerHistory
  def initialize(miner,position)
    @miner = miner
    @position = position
  end

  def time
    to_date(@miner[@position].try(:time))
  end

  def reported_hashrate
    to_ghs(@miner[@position].try(:reported_hashrate))
  end

  def average_hashrate
    to_ghs(@miner[@position].try(:average_hashrate))
  end
 
  def current_hashrate
    to_ghs(@miner[@position].try(:current_hashrate))
  end

  def valid_shares
    @miner[@position].try(:valid_shares)
  end

  def invalid_shares
    @miner[@position].try(:invalid_shares)
  end

  def stale_shares
    @miner[@position].try(:stale_shares)
  end

  def active_workers
    @miner[@position].try(:active_workers)
  end
end
