class MinerBlocks
  def initialize(blocks)
    @args = %i[paid_on number type amount tx_hash]
    @attrs = blocks
  end
end
