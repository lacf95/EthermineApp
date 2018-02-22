class MinerRounds
  include EthermineConvertions
  def initialize(attrs)
    @attrs = attrs
  end

  def block
    @attrs.try(:block)
  end

  def amount
    @attrs.try(:amount)
  end
end
