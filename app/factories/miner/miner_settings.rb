class MinerSettings
  include EthermineConvertions
  def initialize(miner)
    @miner = miner
  end

  def email
    @miner.try(:email) == nil ? 'N/V' : @miner.try(:email)
  end

  def monitor
    @miner.try(:monitor) == 1 ? 'Yes' : 'No'
  end

  def min_payout
    @miner.try(:min_payout) == nil ? 'N/V' : @miner.try(:min_payout)
  end

  def ip
    @miner.try(:ip) == nil ? 'N/V' : @miner.try(:ip)
  end
end
