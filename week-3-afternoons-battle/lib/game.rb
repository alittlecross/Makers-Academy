# frozen_string_literal: true

# responsible for game functionality
class Game
  attr_reader :players, :friend, :foe, :winner, :msg

  def initialize(player1, player2, msg)
    @players = [player1, player2]
    @friend = 0
    @foe = 1
    @winner = 2
    @msg = msg
  end

  def self.create(player1, player2, msg)
    @game = Game.new(player1, player2, msg)
  end

  def self.instance
    @game
  end

  def switch
    @friend = friend.zero? ? 1 : 0
    @foe = foe.zero? ? 1 : 0
  end

  def ready(type, weapon, prop)
    foe_wake_up
    type ? heal : steady(weapon, prop)
    foe_recover
    friend_focus
    switch
  end

  def steady(weapon, prop, chance = rand(3))
    players[friend].torpor && chance.zero? ? @msg.miss(self) : go(weapon, prop)
  end

  def go(weapon, prop)
    one = random_health(weapon)
    random_mobility(prop)
    two = sick_check ? one_health : 0
    @winner = friend if points_check
    @msg.attack(self, weapon, one, two)
  end

  def foe_wake_up
    players[foe].wake_up
  end

  def foe_recover
    players[foe].recover
  end

  def friend_focus
    players[friend].focus
  end

  def random_health(weapon)
    players[foe].health(weapon)
  end

  def one_health
    players[foe].health(-1)
  end

  def random_mobility(prop)
    players[foe].mobility(prop)
  end

  def sick_check
    players[foe].sick
  end

  def points_check
    players[foe].points < 1
  end

  def heal
    players[friend].health(1, 19)
    @msg.heal(self)
  end
end
