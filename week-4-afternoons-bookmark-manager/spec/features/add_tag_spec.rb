# frozen_string_literal: true

feature 'Add Tag' do
  scenario 'users can add tags to specific bookmarks' do
    sign_up
    create_bookmark
    first('.add-tag').click
    fill_in('tag', with: 'news')
    click_button('tag')

    expect(page).to have_content('news')
  end
end
