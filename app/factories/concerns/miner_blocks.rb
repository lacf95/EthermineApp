class MinerBlocks
  def initialize(attrs)
    @attrs = attrs
  end

  def paid_on
    @attrs.try(:paid_on)
  end

  def number
    @attrs.try(:number)
  end

  def type
    @attrs.try(:type)
  end

  def amount
    @attrs.try(:amount)
  end

  def tx_hash
    @attrs.try(:tx_hash)
  end
end
