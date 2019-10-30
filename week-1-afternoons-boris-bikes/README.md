# Boris Bikes

Makers Week 1 (afternoons) - This project is an application that emulates the docking station/bikes/van/garage infrastructure required to deliver a 'Boris Bikes' like system.

## Getting started

Assuming you have `git` installed, in the location of your choice, in Terminal:

`git clone git@github.com:alittlecross/boris-bikes.git`

`cd` into the `boris-bikes` folder.

Assuming you have `Ruby` and `Bundler` installed, in that same location, in Terminal:

`bundle`

## Usage

In that same location, in Terminal:

`irb -r ./lib/boris_bikes.rb`

To create a new docking station:

`barbican = DockingStation.new`

To create a new bike:

`bike_01 = Bike.new`

To dock a bike in a docking station:

`barbican.dock(bike_01)`

To release a working bike from a docking station:

`barbican.release(true)`

To report a bike as broken:

`bike_01.broken`

To release a broken bike from a docking station:

`barbican.release(false)`

To create a new van:

`transit = Van.new`

To dock a bike in a van:

`transit.dock(bike_01)`

To release a broken bike from a van:

`transit.release(false)`

To create a new garage:

`the_works = Garage.new`

To dock a bike in a garage:

`the_works.dock(bike_01)`

To report a bike as fixed:

`bike_01.fixed`

To release a working bike from a garage:

`the_works.release(true)`

To release a working bike from a van:

`transit.release(true)`

## Running tests

In that same location, in Terminal:

`rspec`

## Linting

In that same location, in Terminal:

`rubocop`
