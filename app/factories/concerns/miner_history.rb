class MinerHistory
  include EthermineConvertions
  def initialize(attrs)
    @attrs = attrs
  end

  def time
    to_date(@attrs.try(:time))
  end

  def reported_hashrate
    to_ghs(@attrs.try(:reported_hashrate))
  end

  def average_hashrate
    to_ghs(@attrs.try(:average_hashrate))
  end

  def current_hashrate
    to_ghs(@attrs.try(:current_hashrate))
  end

  def valid_shares
    @attrs.try(:valid_shares)
  end

  def invalid_shares
    @attrs.try(:invalid_shares)
  end

  def stale_shares
    @attrs.try(:stale_shares)
  end

  def active_workers
    @attrs.try(:active_workers)
  end

end
