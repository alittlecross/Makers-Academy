# frozen_string_literal: true

require 'oystercard'

describe Oystercard do
  before(:each) do
    @pasmo = Oystercard.new
  end

  context 'no balance on card' do
    describe '#touch_in' do
      it 'will not #touch_in if below minimum balance' do
        message = 'Insufficient balance to touch in'
        expect { @pasmo.touch_in('Acton Town') }.to raise_error message
      end
    end
  end
end
