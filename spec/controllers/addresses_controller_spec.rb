require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  include MockMinerFactory
  let(:user){ create :user }
  let(:address){ create :address, user: user }

  before do
    session[:user_id] = user.id
  end

  it 'renders the show addresses view' do
    mock_miner_factory
    get :show, params: { id: address }
    expect(response).to be_ok
  end

  it 'renders the new addresses view' do
    get :new
    expect(response).to be_ok
  end

  it 'renders the edit addresses view' do
    get :edit, params: { id: address }
    expect(response).to be_ok
  end

  it 'create a new address' do
    post :create, params: { address: {
      alias: 'test',
      address: 'd7049af37A18BEDC9A85FE7b378f6085F17050C6',
      user: user
    } }
    expect(response).to redirect_to home_index_path
  end
  
  it 'failed creating an incomplete address' do
    post :create, params: { address: {
      alias: '',
      address: 'd7049af37A18BEDC9A85FE7b378f6085F17050C6',
      user: user
    } }
    expect(response).to redirect_to new_address_path
  end

  it 'edit an address' do
    patch :update, params: { id: address, address: {
      alias: 'test',
      address: 'd7049af37A18BEDC9A85FE7b378f6085F17050C6',
      user_id: user.id
    } }
    expect(response).to redirect_to address
  end

  it 'failed edit an incomplete address' do
    patch :update, params: { id: address, address: {
      alias: '',
      address: 'd7049af37A18BEDC9A85FE7b378f6085F17050C6',
      user_id: user.id
    } }
    expect(response).to redirect_to edit_address_path address
  end

  it 'destroys addresses' do
    delete :destroy, params: { id: address }
    expect(response).to redirect_to home_index_path
  end

  it 'failed destroys addresses' do
    delete :destroy, params: { id: 100 }
    expect(response).to redirect_to home_index_path
  end
end
