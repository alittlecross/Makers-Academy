# frozen_string_literal: true

require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2, msg) }
  let(:player_1) { double :player }
  let(:player_2) { double :player }
  let(:msg) { double :message }

  describe '#go' do
    before(:each) do
      setup_allows_msg(msg)
      setup_allows_player_1(player_1)
      setup_allows_player_2_a(player_2)
      setup_allows_player_2_b(player_2)
    end

    it "should reduce the foe's health points" do
      expect(player_2).to receive(:health)
      game.go(-1, 1)
    end

    it "should try to affect the foe's mobility" do
      expect(player_2).to receive(:mobility)
      game.go(-1, 1)
    end

    it 'should check if there is a winner' do
      expect(player_2).to receive(:points) { 1 }
      game.go(-1, 1)
    end
  end
end
