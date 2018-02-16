class MinerHistory
  def initialize(miner)
    @miner=miner
    binding.pry
  end

  def time
    @miner.try(:time)
    binding.pry
  end

  def reported_hashrate
  end

  def average_hashrate
  end
  
  def current_hashrate
  end

  def valid_shares
  end

  def invalid_shares
  end

  def stale_shares
  end

  def active_workers
  end
end
