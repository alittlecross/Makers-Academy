# frozen_string_literal: true

feature 'Filter By Tag' do
  scenario 'users can see bookmarks filtered by tag' do
    sign_up
    create_bookmark
    create_tag
    first('.tag > a').click

    expect(page).to have_content('BBC')
    expect(page).not_to have_content('Channel 4')
  end
end
