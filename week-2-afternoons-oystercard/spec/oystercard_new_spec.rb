# frozen_string_literal: true

require 'oystercard'

describe Oystercard do
  before(:each) do
    @pasmo = Oystercard.new
  end

  it 'has a default balance' do
    expect(subject.balance).to eq(0)
  end

  it 'has a variable balance' do
    oystercard = Oystercard.new(50)
    expect(oystercard.balance).to eq(50)
  end

  it 'limits the maximum balance' do
    oystercard = Oystercard.new(100)
    expect(oystercard.balance).to eq(90)
  end

  it 'has no journeys recorded' do
    expect(subject.history).to be_empty
  end

  it 'raises an error if trying to exceed the CARD_LIMIT' do
    subject.top_up(Oystercard::CARD_LIMIT)
    expect { subject.top_up(10) }.to raise_error 'Maximum balance exceeded'
  end

  it 'adds to the balance' do
    expect { subject.top_up(10) }.to change { subject.balance }.by(10)
  end
end
