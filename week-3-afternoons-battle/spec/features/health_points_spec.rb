# frozen_string_literal: true

feature 'Health Points' do
  scenario "Player 1 can view player 2's health points" do
    sign_in_and_play
    expect(page).to have_content('Rick: 60')
  end

  scenario "Player 2 can view player 1's health points" do
    sign_in_and_play
    expect(page).to have_content('Morty: 60')
  end
end
