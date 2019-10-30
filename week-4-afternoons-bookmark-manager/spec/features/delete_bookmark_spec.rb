# frozen_string_literal: true

feature 'Delete Bookmark' do
  scenario 'users can remove a specific bookmark' do
    sign_up
    create_bookmark
    click_link('delete')

    expect(page).not_to have_content('BBC')
  end
end
