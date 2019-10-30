# Oystercard

Makers Week 2 (afternoons) - This project replicates the card/station/journey infrastructure required to deliver an 'Oystercard' like system.

## Getting started

Assuming you have `git` installed, in the location of your choice, in Terminal:

`git clone git@github.com:alittlecross/oystercard.git`

`cd` into the `oystercard` folder.

Assuming you have `Ruby` and `Bundler` installed, in that same location, in Terminal:

`bundle`

## Usage

In that same location, in Terminal:

`irb -r ./lib/oystercard.rb`

To create a new Oystercard:

`myCard = Oystercard.new`

This will create the card with a balance of 0; to create a new Oystercard with a starting balance:

`myCard = Oystercard.new(50)`

There is a card limit of 90; creating a new Oystercard with a starting balance higher than 90 will set the balance to 90.

To add funds to an Oystercard card:

`myCard.top_up(15)`

The card requires a minimum balance before the user is allowed to start a journey; this is the sum of the most expensive journey available plus one penalty fare.

To start a journey:

`myCard.touch_in("Barbican")`

All London tube stations are accepted; the user will receive an error message if they enter something that is not a London tube station.

To check the list of London tube stations:

`Station.list`

To complete a journey:

`myCard.touch_out("King's Cross St Pancras")`

1 credit, plus 1 credit for each zone crossed on the journey, will be deducted from the Oystercard balance at the end of the journey.

If the user touched in but did not touch out they will be charged a penalty fare on commencement of their next journey.

If the user touched out but did not touch in they will be charged a penalty fare on completion of that journey.

A complete journey history can be viewed:

`myCard.history`

## Running tests

In that same location, in Terminal:

`rspec`

## Linting

In that same location, in Terminal:

`rubocop`
