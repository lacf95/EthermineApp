require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include MockGeneralInfo
  let(:user){ create :user }

  before do
    session[:user_id] = user.id
  end

  it 'remders the user\'s dashboard successfully' do
    mock_general_info
    get :me
    expect(response).to be_ok
  end

  it 'remders the user\'s dashboard successfully' do
    get :profile
    expect(response).to be_ok
  end

  it 'remders the user\'s dashboard successfully' do
    get :edit
    expect(response).to be_ok
  end

  it 'remders the user\'s dashboard successfully' do
    patch :update, params: { user: {first_name: 'Cesar', last_name: 'Gomez'} }
    expect(response).to redirect_to profile_path
  end

  it 'remders the user\'s dashboard successfully' do
    patch :update, params: { user: {email: '12444'} }
    expect(response).to render_template :edit
  end
end
