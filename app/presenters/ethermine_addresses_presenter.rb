class EthermineAddressesPresenter
  attr_reader :addresses
  def initialize(addresses)
    @client = EtherClient.new
    @addresses = addresses.map { |address| get_data(address) }
  end

  private

  def get_data(address)
    address.class.module_eval { attr_accessor :statistics }
    @client.miner_id = address.address
    address.statistics = @client.miner.statistics
    address
  end
end
