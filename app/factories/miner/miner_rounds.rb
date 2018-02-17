class MinerRounds
  def initialize(miner)
    @miner=miner
  end

  def block
    @miner.try(:block)
  end

  def amount
    @miner.try(:amount)
  end
end
