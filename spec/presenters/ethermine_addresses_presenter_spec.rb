require 'rails_helper'

RSpec.describe EthermineAddressesPresenter do
  let(:user) { create :user }
  let(:addresses) { build_list :address, 2, user: user }
  
  it 'Address have statistics attribute' do
    address_presenter = EthermineAddressesPresenter.new(addresses)
    address_presenter.addresses.each do |address|
      expect(address).to respond_to(:statistics)
    end
  end
end
