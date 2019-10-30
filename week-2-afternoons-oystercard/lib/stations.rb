# frozen_string_literal: true

require 'csv'

# to record station names
class Station
  class << self
    attr_reader :list
  end

  @list = {}

  file = CSV.open('./csv/station_list.csv', 'r')

  file.each do |line|
    station_name, zone = line
    @list[station_name] = zone.to_i
  end
end
