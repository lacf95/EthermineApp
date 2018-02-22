class MinerSettings
  include EthermineAttrs

  def initialize(settings)
    @attrs = [:email, :monitor, :min_payout, :ip]
    @args = settings
  end
end
