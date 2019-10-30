# frozen_string_literal: true

require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2, msg) }
  let(:player_1) { double :player }
  let(:player_2) { double :player }
  let(:msg) { double :message }

  describe '#switch' do
    it 'should toggle between players' do
      expect(game.friend).to eq(0)
      expect(game.foe).to eq(1)
      game.switch
      expect(game.friend).to eq(1)
      expect(game.foe).to eq(0)
    end
  end
end
