class MinerBlocks
  def initialize(miner, position)
    @miner = miner
    @position = position
  end

  def paid_on
    miner[@position].try(:paid_on)
  end

  def number
    @miner[@position].try(:number)
  end

  def type
    @miner[@position].try(:type)
  end

  def amount
    @miner[@position].try(:amount)
  end

  def tx_hash
    @miner[@position].try(:tx_hash)
  end
end

