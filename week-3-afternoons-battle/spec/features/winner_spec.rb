# frozen_string_literal: true

feature 'Winner' do
  scenario 'should be declared' do
    name1 = Player.new('Rick', 1)
    name2 = Player.new('Morty', 1)
    @game = Game.create(name1, name2, Message.new)

    visit('/fight')
    click_button('Attack !!!')
    expect(page).to have_content("Battle!\nRick\nwinner")
  end
end
