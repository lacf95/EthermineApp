class MinerFactory
  load 'ethermine_convertions.rb'
  load 'miner/miner_settings.rb'
  load 'miner/miner_statistics.rb'
  load 'miner/miner_history.rb'
  load 'miner/miner_payout.rb'
  load 'miner/miner_rounds.rb'
  load 'miner/miner_blocks.rb'

  def initialize(miner)
    @miner = miner
  end

  def payout(position)
    @miner_payout ||= @miner.payouts
    MinerPayout.new(@miner_payout, position)
  end

  def history(position)
    @miner_history ||= @miner.history
    MinerHistory.new(@miner_history, position)
  end

  def blocks(position)
    @miner_blocks ||= @miner.blocks
    MinerBlocks.new(@miner_blocks, position)
  end

  def rounds(position)
    @miner_rounds ||= @miner.rounds
    MinerRounds.new(@miner_rounds, position)
  end

  def settings
    MinerSettings.new(@miner.settings)
  end

  def statistics
    MinerStatistics.new(@miner.statistics)
  end
end
