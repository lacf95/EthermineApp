require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) { create :user }

  it 'redirects to login without a session' do
    get :index
    expect(response).to redirect_to login_path
  end

  it 'redirects to user\'s me when there\'s a session' do
    session[:user_id] = user.id
    get :index
    expect(response).to redirect_to me_users_path
  end
end
