class MinerRounds
  include EthermineAttrs
  def initialize(rounds)
    @attrs = %i[block amount]
    @args = rounds
  end
end
