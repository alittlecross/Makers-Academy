# frozen_string_literal: true

require_relative 'bike'
require_relative 'bike_container'

# a bike container for holding bike for repair
class Garage
  include BikeContainer
end
