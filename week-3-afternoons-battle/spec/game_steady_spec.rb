# frozen_string_literal: true

require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2, msg) }
  let(:player_1) { double :player }
  let(:player_2) { double :player }
  let(:msg) { double :message }

  describe '#steady' do
    it 'should take the correct action (miss)' do
      allow(player_1).to receive(:torpor) { true }
      expect(msg).to receive(:miss)
      game.steady(-1, 0, 0)
    end

    it 'should take the correct action (attack)' do
      allow(player_1).to receive(:torpor) { false }
      expect(game).to receive(:go)
      game.steady(-1, 0, 1)
    end
  end
end
