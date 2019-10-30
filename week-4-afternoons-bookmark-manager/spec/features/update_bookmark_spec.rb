# frozen_string_literal: true

feature 'Update Bookmark' do
  scenario 'users can change a specific bookmark' do
    sign_up
    create_bookmark
    click_link('update')
    fill_in('title', with: 'Channel 4')
    fill_in('url', with: 'http://www.channel4.com')
    click_button('update')

    expect(page).not_to have_content('BBC')
    expect(page).to have_content('Channel 4')
  end
end
