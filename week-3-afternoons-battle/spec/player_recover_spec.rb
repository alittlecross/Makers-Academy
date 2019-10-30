# frozen_string_literal: true

require 'player'

describe Player do
  subject(:player) { described_class.new('Rick') }

  describe '#focus' do
    it 'should get @torpor back to false' do
      player.mobility(0, 0)
      player.focus
      expect(player.torpor).to eq(false)
    end
  end

  describe '#get_well' do
    it 'should get @sick back to false' do
      player.mobility(1, 0)
      player.recover
      expect(player.sick).to eq(false)
    end
  end

  describe '#wake_up' do
    it 'should get @zzz back to false' do
      player.mobility(2, 0)
      player.wake_up
      expect(player.zzz).to eq(false)
    end
  end
end
