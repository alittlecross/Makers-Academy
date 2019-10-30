# frozen_string_literal: true

require 'json'

# saves and returns the state of thermostat
class State
  def self.last
    File.read('json/state.json')
  end

  def self.save(location, temperature, power_saving_text)
    power_saving = power_saving_text == 'true'
    last_state = {
      'lastLocation' => location,
      'lastTemperature' => temperature.to_i,
      'lastPowerSaving' => power_saving
    }
    File.open('json/state.json', 'w') do |item|
      item.write(last_state.to_json)
    end
  end
end
