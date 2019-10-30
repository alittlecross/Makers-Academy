# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/cross_origin'
require_relative './src/rb/state'

# the controller
class StateServer < Sinatra::Base
  before do
    headers('Access-Control-Allow-Origin' => '*')
  end

  get '/' do
    content_type :json
    return State.last
  end

  post '/' do
    location = params[:lastLocation]
    temperature = params[:lastTemperature]
    power_saving = params[:lastPowerSaving]
    State.save(location, temperature, power_saving)
    return
  end
end
