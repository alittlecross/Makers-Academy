# frozen_string_literal: true

feature 'Player Healing' do
  scenario "can use 'Heal'" do
    sign_in_and_play
    click_button('Heal !!!')
    expect(page).to have_content('Rick used a potion to heal.')
  end
end
