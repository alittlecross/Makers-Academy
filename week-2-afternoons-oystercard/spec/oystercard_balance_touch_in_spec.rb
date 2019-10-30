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

    describe '#touch_in' do
      it 'checks if the entry_station exists' do
        message = "Station doesn't exist"
        expect { @pasmo.touch_in('foo bar') }.to raise_error message
      end

      it 'checks if the card was touched out on the last journey' do
        @pasmo.touch_in('Acton Town')
        @pasmo.touch_in('Woodside Park')
        expect(@pasmo.history.first.exit_station).to eq('did not touch out')
      end

      it 'records the entry station' do
        @pasmo.touch_in('Acton Town')
        expect(@pasmo.history.last.entry_station).to eq('acton town')
      end
    end
  end
end
