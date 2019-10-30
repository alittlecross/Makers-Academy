# frozen_string_literal: true

require_relative 'journey'
require_relative 'stations'

# to record all journies
class Oystercard
  attr_reader :balance, :history

  CARD_LIMIT = 90
  MINIMUM_BALANCE = 15

  def initialize(balance = 0)
    @balance = balance > CARD_LIMIT ? CARD_LIMIT : balance
    @history = []
  end

  def top_up(amount)
    raise 'Maximum balance exceeded' if balance + amount > CARD_LIMIT

    @balance += amount
  end

  def touch_in(entry_station)
    raise 'Insufficient balance to touch in' if balance < MINIMUM_BALANCE

    check_station(entry_station)
    check_touched_out
    start_journey(entry_station)
  end

  def touch_out(exit_station)
    check_station(exit_station)
    check_touched_in
    complete_journey(exit_station)
    deduct(history.last.fare)
  end

  private

  def check_station(user_input)
    raise "Station doesn't exist" if Station.list[user_input.downcase].nil?
  end

  def check_touched_in
    return unless check_last || !check_exit

    history << Journey.new('did not touch in')
    deduct(history.last.fare)
  end

  def check_touched_out
    return unless !check_last && check_exit

    history.last.complete_journey('did not touch out')
    deduct(history.last.fare)
  end

  def check_last
    history.last.nil?
  end

  def check_exit
    history.last.exit_station.nil?
  end

  def start_journey(entry_station)
    history << Journey.new(entry_station)
  end

  def complete_journey(exit_station)
    history.last.complete_journey(exit_station)
  end

  def deduct(fare)
    @balance -= fare
  end
end
