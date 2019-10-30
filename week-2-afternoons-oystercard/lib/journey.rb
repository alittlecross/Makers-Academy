# frozen_string_literal: true

require_relative 'stations'

# to record individual journies
class Journey
  attr_reader :entry_station, :exit_station, :fare

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station)
    @entry_station = entry_station.downcase
    @exit_station = nil
    @fare = 0
  end

  def complete_journey(exit_station)
    @exit_station = exit_station.downcase
    calculate_fare
  end

  def calculate_fare
    @fare += if incomplete_journey
               PENALTY_FARE
             else
               MINIMUM_FARE + zones_crossed
             end
  end

  private

  def incomplete_journey
    entry_station == 'did not touch in' || exit_station == 'did not touch out'
  end

  def zones_crossed
    (Station.list[entry_station] - Station.list[exit_station]).abs
  end
end
