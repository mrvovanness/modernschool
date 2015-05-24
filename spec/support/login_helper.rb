def login(email, password)
  visit root_path
  fill_in('user[email]', with: email)
  fill_in('user[password]', with: password)
  click_button 'Log in'
end
