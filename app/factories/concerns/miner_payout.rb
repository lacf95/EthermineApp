class MinerPayout
  include EthermineAttrs
  def initialize(payout)
    @attrs = [:paid_on,:start,:end, :amount, :tx_hash]
    @args = payout
  end
end

