# frozen_string_literal: true

feature 'View Bookmark' do
  scenario 'users can see a list of all bookmarks' do
    sign_up
    create_bookmark

    expect(page).to have_content('BBC')
  end
end
