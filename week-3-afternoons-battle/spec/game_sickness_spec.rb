# frozen_string_literal: true

require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2, msg) }
  let(:player_1) { double :player }
  let(:player_2) { double :player }
  let(:msg) { double :message }

  describe '#go' do
    before(:each) do
      setup_allows_msg(msg)
      setup_allows_player_1(player_1)
      setup_allows_player_2_a(player_2)
      setup_allows_player_2_b(player_2)
    end

    it 'should attack again if the foe is sick' do
      allow(player_2).to receive(:sick) { true }
      expect(player_2).to receive(:health).twice
      game.go(-1, 1)
    end

    it 'should take no futher action if the foe is not sick' do
      allow(player_2).to receive(:sick) { false }
      expect(player_2).to receive(:health).once
      game.go(-1, 1)
    end
  end
end
