class MinerPayout
  def initialize(miner)
    @miner=miner
  end

  def paid_on
    @miner.try(:paid_on)
  end

  def start
    @miner.try(:start)
  end

  def end
    @miner.try(:end)
  end

  def amount
    @miner.try(:amount)
  end

  def tx_hash
    @miner.try(:tx_hash)
  end
end

