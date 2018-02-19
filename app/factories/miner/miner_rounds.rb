class MinerRounds
  def initialize(miner,position)
    @miner = miner
    @position = position
  end

  def block
    @miner[@position].try(:block)
  end

  def amount
    @miner[@position].try(:amount)
  end
end
