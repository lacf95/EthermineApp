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
    get :show, params: address.as_json
    expect(response).to be_ok
  end

  it 'renders the new addresses view' do
    get :new
    expect(response).to be_ok
  end

  it 'renders the edit addresses view' do
    get :edit, params: address.as_json
    expect(response).to be_ok
  end

  it 'create a new address' do
    post :create, params: address.as_json(root: true)
    expect(response).to redirect_to home_index_path
  end
 
  it 'failed creating an incomplete address' do
    address.alias = ''
    post :create, params: address.as_json(root: true)
    expect(response).to redirect_to new_address_path
  end

  it 'edit an address' do
    patch :update, params: { id: address, address: address.as_json }
    expect(response).to redirect_to address
  end

  it 'failed edit an incomplete address' do
    address.alias = ''
    patch :update, params: { id: address, address: address.as_json }
    expect(response).to redirect_to edit_address_path address
  end

  it 'destroys addresses' do
    delete :destroy, params: address.as_json
    expect(response).to redirect_to home_index_path
  end

  it 'failed destroys addresses' do
    delete :destroy, params: { id: 100 }
    expect(response).to redirect_to home_index_path
  end
end
