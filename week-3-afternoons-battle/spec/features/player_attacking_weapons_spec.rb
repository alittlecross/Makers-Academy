# frozen_string_literal: true

feature 'Player Attacking' do
  scenario "can use 'Punch'" do
    sign_in_and_play
    click_button('Attack !!!')
    expect(page).to have_content('Rick used a punch, Morty took')
  end

  scenario "can use 'Slingshot'" do
    sign_in_and_play
    choose('slingshot')
    click_button('Attack !!!')
    expect(page).to have_content('Rick used a slingshot, Morty took')
  end

  scenario "can use 'Mallet'" do
    sign_in_and_play
    choose('hammer')
    click_button('Attack !!!')
    expect(page).to have_content('Rick used a hammer, Morty took')
  end

  scenario "can use 'Axe'" do
    sign_in_and_play
    choose('axe')
    click_button('Attack !!!')
    expect(page).to have_content('Rick used an axe, Morty took')
  end
end
