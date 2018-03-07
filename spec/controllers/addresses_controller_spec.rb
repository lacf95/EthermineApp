require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  include MockMinerFactory
  let!(:user){ create :user }
  let!(:address){ create :address, user: user }

  before do
    session[:user_id] = user.id
  end

  describe 'GET #show' do
    it 'renders the show addresses view' do
      mock_miner_factory
      get :show, params: address.as_json
      expect(response).to be_ok
    end
  end

  describe 'GET #new' do
    it 'renders the new addresses view' do
      get :new
      expect(response).to be_ok
    end
  end

  describe 'GET #edit' do
    it 'renders the edit addresses view' do
      get :edit, params: address.as_json
      expect(response).to be_ok
    end
  end

  describe 'POST #create' do
    context 'with complete params' do
      it 'create a new address' do
        post :create, params: address.as_json(root: true)
        expect(response).to redirect_to home_index_path
      end
    end


    context 'with incomplete params' do
      it 'failed creating' do
        address.alias = ''
        post :create, params: address.as_json(root: true)
        expect(response).to redirect_to new_address_path
      end
    end
  end

  describe 'PATCH #update' do
    context 'with complete params' do
      it 'edit' do
        patch :update, params: { id: address, address: address.as_json }
        expect(response).to redirect_to address
      end
    end

    context 'with incomplete params' do
      it 'failed edit' do
        address.alias = ''
        patch :update, params: { id: address, address: address.as_json }
        expect(response).to redirect_to edit_address_path address
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'existing address' do
      it 'destroy' do
        expect{
          delete :destroy, params: address.as_json
        }.to change(Address, :count).by(-1)
        expect(response).to redirect_to home_index_path
      end
    end

    context 'unexisting address' do
      it 'failed destroy' do
        expect{
          delete :destroy, params: { id: 100 }
        }.to change(Address, :count).by(0)
        expect(response).to redirect_to home_index_path
      end
    end
  end
end
