module EthermineConvertions
  def to_date(value)
    Time.strptime(value.to_s, '%s').to_formatted_s(:long).to_s
  end

  def to_ghs(value)
    "#{(value / 1_000_000_000).round(4)} GH/s"
  end

  def to_eth(value)
    "#{(Float(value) / 1_000_000_000_000_000_000).round(5)} ETH"
  end
end
