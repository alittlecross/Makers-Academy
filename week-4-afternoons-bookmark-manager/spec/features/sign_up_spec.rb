# frozen_string_literal: true

feature 'Sign Up' do
  scenario 'a new user can sign up' do
    visit('/')
    within('#second-form') { fill_in('email', with: 'bookmark@manager.com') }
    within('#second-form') { fill_in('password', with: 'password') }
    within('#second-form') { click_button('sign up') }

    users = @connection.exec("
      SELECT *
      FROM users
      WHERE email = 'bookmark@manager.com';
      ")

    expect(users.any?).to eq(true)
  end

  scenario 'an existing user cannot sign up again' do
    setup_user

    visit('/')
    within('#second-form') { fill_in('email', with: 'bookmark@manager.com') }
    within('#second-form') { fill_in('password', with: 'password') }
    within('#second-form') { click_button('sign up') }

    expect(page).to have_content('There is already an account with that email.')
  end
end
