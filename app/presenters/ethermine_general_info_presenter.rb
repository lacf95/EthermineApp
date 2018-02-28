class EthermineGeneralInfoPresenter
  attr_reader :pool_stats, :price, :network
  def initialize
    @ether = EtherClient.new
    @stats = @ether.pool.statistics
    get_data
  end

  def get_data
    @pool_stats   = @stats.pool_stats
    @price        = @stats.price
    @network      = @ether.pool.network
    @network.time = Time.at(@network.time).to_formatted_s(:short)
  end
end
