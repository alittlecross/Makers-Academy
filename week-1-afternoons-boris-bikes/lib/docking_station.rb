# frozen_string_literal: true

require_relative 'bike'
require_relative 'bike_container'

# a bike container for holding bikes for loaning out
class DockingStation
  include BikeContainer
end
