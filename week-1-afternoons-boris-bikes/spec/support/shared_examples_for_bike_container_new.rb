# frozen_string_literal: true

shared_examples_for 'BikeContainer new' do
  subject(:bike_container) { described_class.new }
  let(:bike) { double :bike }

  describe '#new' do
    it 'has a default capacity' do
      expect(bike_container.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    end

    it 'has a variable capacity' do
      container_two = DockingStation.new(5)
      expect(container_two.capacity).to eq(5)
    end
  end

  describe '#dock' do
    it 'raises an error when tring to dock not-a-Bike' do
      message = 'That is not a bike'
      expect { bike_container.dock('trolley') }.to raise_error message
    end

    it 'raises an error when full' do
      allow(bike_container).to receive(:type?) { true }
      bike_container.capacity.times { bike_container.dock(bike) }
      message = "#{described_class.name} full"
      expect { bike_container.dock(bike) }.to raise_error message
    end
  end
end
