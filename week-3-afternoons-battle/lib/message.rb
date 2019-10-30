# frozen_string_literal: true

# build the messages shown on screen
class Message
  attr_reader :msg

  def initialize
    @msg = ''
  end

  def heal(game, friend = game.players[game.friend].name)
    @msg = "#{friend} used a potion to heal."
  end

  # rubocop:disable Metrics/ParameterLists
  def attack(
      game,
      weapon,
      points,
      plus,
      friend = game.players[game.friend].name,
      foe = game.players[game.foe].name
    )
    @msg = "#{friend} used #{word(weapon)}, #{foe} took #{-points} damage"
    add(game, plus)
  end
  # rubocop:enable Metrics/ParameterLists

  def miss(game, friend = game.players[game.friend].name)
    @msg = "Because #{friend} was dizzy they missed."
  end

  private

  def add(game, plus)
    @msg += if game.players[game.foe].torpor
              ' and is now dizzy.'
            elsif game.players[game.foe].sick
              ". They also got poisoned so took another #{-plus} damage."
            elsif game.players[game.foe].zzz
              " and is now knocked out; they'll miss their next turn."
            else
              '.'
            end
  end

  def word(weapon)
    case weapon
    when -1 then 'a punch'
    when -2 then 'a slingshot'
    when -3 then 'a hammer'
    when -4 then 'an axe'
    end
  end
end
