# frozen_string_literal: true

feature 'Player Attacking' do
  scenario "can use 'Paralyse'" do
    sign_in_and_play
    click_button('Attack !!!')
    expect(page).to have_content('Rick used a punch, Morty took')
  end

  scenario "can use 'Poison'" do
    sign_in_and_play
    choose('poison')
    click_button('Attack !!!')
    expect(page).to have_content('Rick used a punch, Morty took')
  end

  scenario "can use 'Extra Effort'" do
    sign_in_and_play
    choose('extra-effort')
    click_button('Attack !!!')
    expect(page).to have_content('Rick used a punch, Morty took')
  end
end
