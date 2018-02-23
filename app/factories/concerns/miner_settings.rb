class MinerSettings
  include EthermineAttrs
  def initialize(settings)
    @attrs = %i[email monitor min_payout ip]
    @args = settings
  end
end
