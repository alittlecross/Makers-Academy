# frozen_string_literal: true

require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2, msg) }
  let(:player_1) { double :player }
  let(:player_2) { double :player }
  let(:msg) { double :message }

  describe '#ready' do
    before(:each) do
      setup_allows_msg(msg)
      setup_allows_player_1(player_1)
      setup_allows_player_2_a(player_2)
      setup_allows_player_2_b(player_2)
    end

    it 'should take the correct action (heal)' do
      expect(player_1).to receive(:health)
      expect(msg).to receive(:heal)
      game.ready(true, -1, 0)
    end

    it 'should take the correct action (steady)' do
      expect(game).to receive(:steady)
      game.ready(false, -1, 0)
    end

    it 'should focus the player' do
      expect(player_1).to receive(:focus)
      game.ready(true, -1, 0)
    end
  end
end
