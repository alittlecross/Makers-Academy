# frozen_string_literal: true

def sign_in_and_play
  visit('/')
  fill_in('name_1', with: 'Rick')
  fill_in('name_2', with: 'Morty')
  click_on('Fight !!!')
end

def setup_allows_msg(msg)
  allow(msg).to receive(:attack)
  allow(msg).to receive(:heal)
end

def setup_allows_player_1(player1)
  allow(player1).to receive(:focus)
  allow(player1).to receive(:health)
end

def setup_allows_player_2_a(player2)
  allow(player2).to receive(:health)
  allow(player2).to receive(:mobility)
  allow(player2).to receive(:points) { 1 }
end

def setup_allows_player_2_b(player2)
  allow(player2).to receive(:recover)
  allow(player2).to receive(:sick)
  allow(player2).to receive(:wake_up)
end
