# frozen_string_literal: true

# a module group all the functionality shared amongst different containers
module BikeContainer
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    raise 'That is not a bike' unless type?(bike)
    raise "#{self.class.name} full" if full?

    add(bike)
  end

  def release(status)
    results = check(status)
    word = status ? 'working' : 'broken'
    raise "No #{word} bikes available." unless results.any?

    remove(results[0])
  end

  private

  def type?(bike)
    bike.is_a?(Bike)
  end

  def full?
    @bikes.length >= capacity
  end

  def check(status)
    @bikes.select { |element| element.status == status }
  end

  def add(bike)
    @bikes.push(bike)
  end

  def remove(bike)
    @bikes.delete(bike)
  end
end
