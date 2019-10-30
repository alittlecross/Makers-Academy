# frozen_string_literal: true

# responsible for player functionality
class Player
  attr_reader :name, :points, :torpor, :sick, :zzz

  DEFAULT_HP = 60

  def initialize(name, points = DEFAULT_HP)
    @name = name
    @points = points
    @torpor = false
    @sick = false
    @zzz = false
  end

  def health(factor, degree = rand(3))
    amount = factor * (degree + 1)
    @points += amount
    amount
  end

  def mobility(prop, chance = rand(9))
    return unless chance.zero?

    case prop
    when 0 then @torpor = true
    when 1 then @sick = true
    when 2 then @zzz = true
    end
  end

  def focus
    @torpor = false
  end

  def recover
    @sick = false
  end

  def wake_up
    @zzz = false
  end
end
