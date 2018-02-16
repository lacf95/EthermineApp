class MinerFactory
  require 'miner/miner_history.rb'
  def initialize(miner)
    @miner = miner
  end

  def blocks
    MinerBlocks.new(@miner.blocks)
  end

  def history
    MinerHistory.new(@miner.history)
  end

  def payout
    MinerPayout.new(@miner.payout)
  end

  def rounds
    MinerRounds.new(@miner.rounds)
  end

  def settings
    MinerSettings.new(@miner.settings)
  end

  def statistics
    MinerStatistics.new(@miner.statistics)
  end
end
