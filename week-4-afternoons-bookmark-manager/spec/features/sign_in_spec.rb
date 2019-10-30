# frozen_string_literal: true

feature 'Sign In' do
  scenario 'an existing user can sign in' do
    User.create('bookmark@manager.com', 'password')

    visit('/')
    within('#first-form') { fill_in('email', with: 'bookmark@manager.com') }
    within('#first-form') { fill_in('password', with: 'password') }
    within('#first-form') { click_button('sign in') }

    expect(page).not_to have_content('There is no account with that email.')
  end

  scenario 'a new user cannot sign in' do
    visit('/')
    within('#first-form') { fill_in('email', with: 'bookmark@manager.com') }
    within('#first-form') { fill_in('password', with: 'password') }
    within('#first-form') { click_button('sign in') }

    expect(page).to have_content('There is no account with that email.')
  end
end
