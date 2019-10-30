# frozen_string_literal: true

feature 'Enter Names' do
  scenario 'Players can enter their names' do
    sign_in_and_play
    expect(page).to have_content('Rick: 60')
    expect(page).to have_content('Morty: 60')
  end
end
