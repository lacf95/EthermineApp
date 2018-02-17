class MinerStatistics
  def initialize(miner)
    @miner = miner
  end

  def time
    convert_to_date(@miner.try(:time))
  end

  def last_seen
    convert_to_date(@miner.try(:last_seen))
  end

  def convert_to_date(value)
    DateTime.strptime("#{value}", "%s").to_formatted_s(:long).to_s
  end

  def convert_to_ghs(value)
    "#{(value / 1000000000).round(4)} GH/s"
  end

  def reported_hashrate
    convert_to_ghs(@miner.try(:reported_hashrate))
  end

  def average_hashrate
    convert_to_ghs(@miner.try(:average_hashrate))
  end

  def current_hashrate
    convert_to_ghs(@miner.try(:current_hashrate))
  end

  def valid_shares
    @miner.try(:valid_shares)
  end

  def invalid_shares
    @miner.try(:invalid_shares)
  end

  def stale_shares
    @miner.try(:stale_shares)
  end

  def active_workers
    @miner.try(:active_workers)
  end

  def unpaid
    convert_to_ghs(@miner.try(:unpaid))
  end

  def unconfirmed
    @miner.try(:unconfirmed) == nil ? 'N/V' : @miner.try(:unconfirmed)
  end

  def coins_per_min
    @miner.try(:coins_per_min)
  end

  def usd_per_min
    "#{@miner.try(:usd_per_min)} USD"
  end

  def btc_per_min
    "#{@miner.try(:btc_per_min)} BTC"
  end
end

