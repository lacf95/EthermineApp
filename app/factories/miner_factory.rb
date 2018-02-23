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


class Numeric
  def to_date
    Time.strptime(self.to_s, '%s').to_formatted_s(:long).to_s
  end

  def to_ghs
    "#{(self / 1_000_000_000).round(4)} GH/s"
  end

  def to_eth
    "#{(Float(self) / 1_000_000_000_000_000_000).round(5)} ETH"
  end
 end
