# frozen_string_literal: true

require_relative 'bike'
require_relative 'bike_container'

# a bike containter for transporting bikes from dock to garage
class Van
  include BikeContainer
end
