# frozen_string_literal: true

shared_examples_for 'BikeContainer broken' do
  subject(:bike_container) { described_class.new }
  let(:bike) { double :bike }

  describe '#release_broken_bike' do
    it 'releases broken bikes' do
      allow(bike_container).to receive(:type?) { true }
      allow(bike).to receive(:status) { false }
      bike_container.dock(bike)
      bike_two = bike_container.release(false)
      expect(bike_two.status).to eq(false)
    end

    it 'does not release working bikes by default' do
      allow(bike_container).to receive(:type?) { true }
      allow(bike).to receive(:status) { true }
      bike_container.dock(bike)
      message = 'No broken bikes available.'
      expect { bike_container.release(false) }.to raise_error message
    end
  end
end
