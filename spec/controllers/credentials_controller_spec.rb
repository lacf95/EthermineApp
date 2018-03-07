require 'rails_helper'

RSpec.describe CredentialsController, type: :controller do
  describe 'GET #index' do
    it 'renders the log in form successfully' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    let(:user) { create :user }
    let(:credential_params) { { email: user.email, password: user.password } }

    context 'Right credentials' do
      it 'Redirect to home' do
        post :create, params: { credential: credential_params }
        expect(response).to redirect_to home_index_path
      end

      it 'Sets current session' do
        expect do
          post :create, params: { credential: credential_params }
        end.to(change { session[:user_id] }.to(user.id))
      end
    end

    context 'Wrong credentials' do
      it 'Renders errors' do
        credential_params[:password] = '1'
        post :create, params: { credential: credential_params }
        expect(response).to render_template :index
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create :user }

    before :each do
      session[:user_id] = user.id
    end

    it 'Redirect to log in' do
      delete :destroy
      expect(response).to redirect_to login_path
    end

    it 'Removes the current session' do
      expect { delete :destroy }.to(change { session[:user_id] }.to(nil))
    end
  end
end
