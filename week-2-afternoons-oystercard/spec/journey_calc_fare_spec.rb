# frozen_string_literal: true

require 'journey'

describe Journey do
  before(:each) do
    @monday = Journey.new('Acton Town')
    @tuesday = Journey.new('did not touch in')
  end

  describe '#calculate_fare' do
    it 'records the correct fare for complete journeys' do
      allow(@monday).to receive(:zones_crossed) { 1 }
      @monday.complete_journey('Woodside Park')
      expect(@monday.fare).to eq(2)
    end

    it 'records the PENALTY_FARE for incomplete journeys' do
      @monday.complete_journey('did not touch out')
      @tuesday.complete_journey('Woodside Park')
      expect(@monday.fare).to eq(6)
      expect(@tuesday.fare).to eq(6)
    end
  end
end
