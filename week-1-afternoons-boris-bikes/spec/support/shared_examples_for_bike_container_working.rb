# frozen_string_literal: true

shared_examples_for 'BikeContainer working' do
  subject(:bike_container) { described_class.new }
  let(:bike) { double :bike }

  describe '#release_working_bike' do
    it 'releases working bikes' do
      allow(bike_container).to receive(:type?) { true }
      allow(bike).to receive(:status) { true }
      bike_container.dock(bike)
      bike_two = bike_container.release(true)
      expect(bike_two.status).to eq(true)
    end

    it 'does not release broken bikes by default' do
      allow(bike_container).to receive(:type?) { true }
      allow(bike).to receive(:status) { false }
      bike_container.dock(bike)
      message = 'No working bikes available.'
      expect { bike_container.release(true) }.to raise_error message
    end
  end
end
