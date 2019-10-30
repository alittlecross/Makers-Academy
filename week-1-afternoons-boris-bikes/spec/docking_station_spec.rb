# frozen_string_literal: true

require 'docking_station'
require 'support/shared_examples_for_bike_container_broken'
require 'support/shared_examples_for_bike_container_new'
require 'support/shared_examples_for_bike_container_working'

describe DockingStation do
  it_behaves_like 'BikeContainer broken'
  it_behaves_like 'BikeContainer new'
  it_behaves_like 'BikeContainer working'
end
