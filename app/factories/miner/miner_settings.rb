class MinerSettings
  include EthermineConvertions
  def initialize(settings)
    @settings = settings
  end

  def email
    @settings.try(:email) == nil ? 'N/V' : @settings.try(:email)
  end

  def monitor
    @settings.try(:monitor) == 1 ? 'Yes' : 'No'
  end

  def min_payout
    @settings.try(:min_payout) == nil ? 'N/V' : @settings.try(:min_payout)
  end

  def ip
    @settings.try(:ip) == nil ? 'N/V' : @settings.try(:ip)
  end
end
