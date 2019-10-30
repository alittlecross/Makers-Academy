# frozen_string_literal: true

# to allow creation of bike instances for loaning out
class Bike
  attr_reader :status

  def initialize(status = true)
    @status = status
  end

  def broken
    @status = false
  end

  def fixed
    @status = true
  end
end
