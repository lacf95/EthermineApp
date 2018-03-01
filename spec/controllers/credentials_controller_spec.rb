require 'rails_helper'

RSpec.describe CredentialsController, type: :controller do
  let(:user) { create :user }
  let(:credential) { build :credential }

  it 'renders the log in form successfully' do
    get :index
    expect(response).to be_ok
  end

  it 'logs in successfully' do
    post :create, params: {
      credential: { email: user.email, password: '123456' }
    }
    expect(response).to redirect_to home_index_path
  end

  it 'fails when bad credentials' do
    post :create, params: {
      credential: { email: user.email, password: '1' }
    }
    expect(response).to render_template :index
  end

  it 'destroys the current session' do
    delete :destroy
    expect(response).to redirect_to login_path
  end
end
