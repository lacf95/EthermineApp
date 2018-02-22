class MinerFactory
  def initialize(miner)
    @miner = miner
  end

  def payouts
    payouts = @miner.payouts
    @miner_payouts = payouts.map do |payout|
      MinerPayout.new(payout)
    end
  end

  def histories
    histories = @miner.history
    @miner_history = histories.map do |history|
      MinerHistory.new(history)
    end
  end

  def blocks
    blocks = @miner.blocks
    @miner_blocks = blocks.map do |block|
      MinerBlocks.new(block)
    end
  end

  def rounds
    rounds = @miner.rounds
    @miner_rounds = rounds.map do |round|
      MinerRounds.new(round)
    end
  end

  def settings
    MinerSettings.new(@miner.settings)
  end

  def statistics
    MinerStatistics.new(@miner.statistics)
  end
end
