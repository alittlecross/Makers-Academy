# frozen_string_literal: true

require 'player'

describe Player do
  subject(:player) { described_class.new('Rick') }

  describe '#name' do
    it "should return the player's name" do
      expect(player.name).to eq('Rick')
    end
  end

  describe '#points' do
    it "should return the player's points" do
      expect(player.points).to eq(described_class::DEFAULT_HP)
    end
  end

  describe '#health' do
    it "can incease and decrease the player's points" do
      expect { player.health(3, 3) }.to change { player.points }.by(12)
      expect { player.health(-3, 3) }.to change { player.points }.by(-12)
    end
  end
end
