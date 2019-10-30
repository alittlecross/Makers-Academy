# frozen_string_literal: true

require 'stations'

describe Station do
  it 'has a list of stations' do
    expect(Station.list['acton town']).to eq(3)
    expect(Station.list['woodside park']).to eq(4)
  end
end
