class MinerBlocks
  def initialize(miner)
    @miner = miner
  end

  def paid_on
    @miner.try(:paid_on)
  end

  def number
    @miner.try(:number)
  end

  def type
    @miner.try(:type)
  end

  def amount
    @miner.try(:amount)
  end

  def tx_hash
    @miner.try(:tx_hash)
  end
end

