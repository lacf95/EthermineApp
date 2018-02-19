class MinerFactory
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
    @miner_payout = @miner.payouts unless @miner_payout
    MinerPayout.new(@miner_payout, position)
  end

  def history(position)
    @miner_history = @miner.history unless @miner_history
    MinerHistory.new(@miner_history, position)
  end

  def blocks(position)
    @miner_blocks = @miner.blocks unless @miner_blocks
    MinerBlocks.new(@miner_blocks, position)
  end

  def rounds(position)
    @miner_rounds = @miner.rounds unless @miner_rounds
    MinerRounds.new(@miner_rounds, position)
  end

  def settings
    MinerSettings.new(@miner.settings)
  end

  def statistics
    MinerStatistics.new(@miner.statistics)
  end

  def to_date(value)
    DateTime.strptime("#{value}", '%s').to_formatted_s(:long).to_s
  end

  def to_ghs(value)
    "#{(value / 1_000_000_000).round(4)} GH/s"
  end

  def to_eth(value)
    "#{(Float(value) / 1000000000000000000).round(5)} ETH"
  end

end
