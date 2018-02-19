class MinerPayout
  include EthermineConvertions
  def initialize(miner, position)
    @miner = miner
    @position = position
  end

  def paid_on
    to_date(@miner[@position].try(:paid_on))
  end

  def start
    @miner[@position].try(:start)
  end

  def end
    @miner[@position].try(:end)
  end

  def amount
    to_eth(@miner[@position].try(:amount))
  end

  def tx_hash
    @miner[@position].try(:tx_hash)
  end
end

