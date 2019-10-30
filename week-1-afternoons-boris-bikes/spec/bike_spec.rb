# frozen_string_literal: true

require 'bike'

describe Bike do
  describe '#new' do
    it 'has a default status' do
      expect(subject.status).to eq(true)
    end

    it 'has a changeable status' do
      bike = Bike.new(false)
      expect(bike.status).to eq(false)
    end
  end

  describe '#is_broken' do
    it 'changes the status to false' do
      bike = Bike.new
      bike.broken
      expect(bike.status).to eq(false)
    end
  end

  describe '#is_fixed' do
    it 'changes the status to true' do
      bike = Bike.new(false)
      bike.fixed
      expect(bike.status).to eq(true)
    end
  end
end
