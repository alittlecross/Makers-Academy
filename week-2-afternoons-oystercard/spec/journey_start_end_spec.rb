# frozen_string_literal: true

require 'journey'

describe Journey do
  before(:each) do
    @monday = Journey.new('Acton Town')
    @tuesday = Journey.new('did not touch in')
  end

  describe '#new' do
    it 'records the entry_station' do
      expect(@monday.entry_station).to eq('acton town')
    end

    it 'does not change the starting value of exit_station' do
      expect(@monday.exit_station).to eq(nil)
    end

    it 'does not change the starting value of fare' do
      expect(@monday.fare).to eq(0)
    end
  end

  describe '#complete_journey' do
    it 'does change the starting value of exit_station' do
      allow(@monday).to receive(:zones_crossed) { 1 }
      @monday.complete_journey('Woodside Park')
      expect(@monday.exit_station).to eq('woodside park')
    end
  end
end
