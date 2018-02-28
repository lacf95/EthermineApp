require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  include Login
  include MockGeneralInfo
  context 'as user' do
    let(:password) { '123456' }
    let(:user)     { create :user, password: password }
    scenario 'I login with correct credentials' do
      mock_general_info
      log_in(user)

      within '.navbar' do
        expect(page.body).to include user.full_name
      end
    end
  end
end
