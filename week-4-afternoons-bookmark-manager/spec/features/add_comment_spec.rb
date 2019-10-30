# frozen_string_literal: true

feature 'Add Comment' do
  scenario 'users can add comments to specific bookmarks' do
    sign_up
    create_bookmark
    first('.add-comment').click
    fill_in('comment', with: 'A news website.')
    click_button('comment')

    expect(page).to have_content('A news website.')
  end
end
