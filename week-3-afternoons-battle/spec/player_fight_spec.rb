# frozen_string_literal: true

require 'player'

describe Player do
  subject(:player) { described_class.new('Rick') }

  describe '#mobility' do
    it 'should be able to set @torpor to true' do
      player.mobility(0, 0)
      expect(player.torpor).to eq(true)
    end

    it 'should be able to set @sick to true' do
      player.mobility(1, 0)
      expect(player.sick).to eq(true)
    end

    it 'should be able to set @zzz to true' do
      player.mobility(2, 0)
      expect(player.zzz).to eq(true)
    end
  end
end
