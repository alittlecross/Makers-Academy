# frozen_string_literal: true

require 'message'

describe Message do
  subject(:msg) { described_class.new }
  let(:game) { double :game }

  describe '#heal' do
    it 'should produce the heal message' do
      msg.heal(game, 'Rick')
      expect(msg.msg).to eq('Rick used a potion to heal.')
    end
  end

  describe '#attack' do
    it 'should produce the attack message' do
      allow(msg).to receive(:add)
      msg.attack(game, -4, -2, 0, 'Rick', 'Morty')
      expect(msg.msg).to eq('Rick used an axe, Morty took 2 damage')
    end
  end

  describe '#miss' do
    it 'should produce the miss message' do
      msg.miss(game, 'Morty')
      expect(msg.msg).to eq('Because Morty was dizzy they missed.')
    end
  end
end
