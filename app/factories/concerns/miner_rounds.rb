class MinerRounds
  include EthermineAttrs
  def initialize(rounds)
    @attrs = [:block, :amount]
    @args = rounds
  end
end
