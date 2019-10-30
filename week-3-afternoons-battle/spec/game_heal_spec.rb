# frozen_string_literal: true

require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2, msg) }
  let(:player_1) { double :player }
  let(:player_2) { double :player }
  let(:msg) { double :message }

  describe '#heal' do
    before(:each) do
      setup_allows_msg(msg)
      setup_allows_player_1(player_1)
      setup_allows_player_2_a(player_2)
      setup_allows_player_2_b(player_2)
    end

    it 'should heal the player' do
      expect(player_1).to receive(:health)
      game.heal
    end

    it 'should build a sentence of what just happened' do
      expect(msg).to receive(:heal)
      game.heal
    end
  end
end
