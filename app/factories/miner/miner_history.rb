class MinerHistory
  def initialize(miner)
    @miner=miner
    binding.pry
  end

  def time
    @miner.try(:time)
  end

  def reported_hashrate
    @miner.try(:reported_hashrate)
  end

  def average_hashrate
    @miner.try(:average_hashrate)
  end
  
  def current_hashrate
    @miner.try(:current_hashrate)
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
en
