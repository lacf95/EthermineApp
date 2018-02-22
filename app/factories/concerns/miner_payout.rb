class MinerPayout
  include EthermineConvertions
  def initialize(attrs)
    @attrs = attrs
  end

  def paid_on
    to_date(@attrs.try(:paid_on))
  end

  def start
    @attrs.try(:start)
  end

  def end
    @attrs.try(:end)
  end

  def amount
    to_eth(@attrs.try(:amount))
  end

  def tx_hash
    @attrs.try(:tx_hash)
  end
end

