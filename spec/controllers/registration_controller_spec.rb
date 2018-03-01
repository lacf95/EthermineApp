require 'rails_helper'

RSpec.describe RegistrationController, type: :controller do
  let(:user){ create :user }

  it 'renders the user index' do
    get :index
    expect(response).to be_ok
  end

  it 'render the index when a user was create' do
    post :create, params: { user: {
      first_name: 'john', last_name: 'doe', email: 'john@doe.com',
      password: '123456'}}
    expect(response).to redirect_to home_index_path
  end

  it 'fails when a user introduce a bad email' do
    post :create, params: {
      user: {email: 'john@doe', password: user.password}
    }
    expect(response).to render_template :index
  end

  it 'render the index when a user confirms the email' do
    get :confirm, params: {token: user.token}
    expect(response).to redirect_to home_index_path
  end

  it 'render the :index after send the email confirmation' do
    session[:user_id] = user.id
    get :signup_email
    expect(response).to redirect_to home_index_path
  end

end
