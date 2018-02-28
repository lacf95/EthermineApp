module Login
  def log_in(user)
    fill_in 'credential[email]', with: user.email
    fill_in 'credential[password]', with: password
    click_button 'Log in'
  end
end
