# frozen_string_literal: true

feature 'Add Bookmark' do
  scenario 'users can add bookmarks' do
    sign_up

    fill_in('title', with: 'BBC')
    fill_in('url', with: 'http://www.bbc.co.uk')
    click_button('add')

    expect(page).to have_content('BBC')
  end

  scenario 'submitted urls get checked' do
    sign_up

    fill_in('title', with: 'BBC')
    fill_in('url', with: 'htp://www.bbc.co.uk')
    click_button('add')

    expect(page).not_to have_content('BBC')
    expect(page).to have_content('You must enter a valid url.')
  end
end
