# frozen_string_literal: true

require 'oystercard'

describe Oystercard do
  before(:each) do
    @pasmo = Oystercard.new
  end

  context 'balance on card' do
    before(:each) do
      @pasmo.top_up(15)
    end

    describe '#touch_out' do
      it 'checks if the card was touched in to this journey' do
        @pasmo.touch_out('Woodside Park')
        expect(@pasmo.history.first.entry_station).to eq('did not touch in')
      end

      it 'records the exit station' do
        @pasmo.touch_in('Acton Town')
        @pasmo.touch_out('Woodside Park')
        expect(@pasmo.history.last.exit_station).to eq('woodside park')
      end

      it 'deducts the fare for this journey from the balance' do
        @pasmo.touch_in('Acton Town')
        @pasmo.touch_out('Woodside Park')
        expect(@pasmo.balance).to eq(13)
      end
    end
  end
end
