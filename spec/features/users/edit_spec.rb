require 'rails_helper'

RSpec.describe 'Edit', type: :feature do
  include Login

  let(:password) { '123456' }
  let(:user) { create :user, password: password, active: true }
  before do
    log_in(user)
  end

  scenario 'The user edit his own information' do
    visit '/profile/edit'
    user.first_name = 'olis'
    fill_in 'user[first_name]', with: user.first_name
    fill_in 'user[last_name]', with: user.last_name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find_field('user[avatar]').set('/home/iaor/Descargas/profile.jpg')
    click_button 'Save Changes'
    expect(page).to have_content user.first_name
    user.reload
    expect(page.find('#user_avatar')['src']).to(
      have_content(user.avatar.original_filename)
    )
  end
end
