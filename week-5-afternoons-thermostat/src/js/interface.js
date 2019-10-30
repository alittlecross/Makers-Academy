'use strict'

var thermostat = new Thermostat()

function saveState (city) {
  $.post('http://localhost:9292/', {
    lastLocation: city,
    lastTemperature: thermostat.temperature,
    lastPowerSaving: thermostat.powerSavingMode
  })
}

function colour () {
  $('#home-temperature').attr('class', thermostat.energyUsage())
}

function onOff () {
  $('#power-saving').text(thermostat.powerSavingMode ? 'ON' : 'OFF')
}

function temperature () {
  $('#home-temperature').text(thermostat.temperature)
}

function getWeather (city) {
  var url = 'http://api.openweathermap.org/data/2.5/weather?q=' + city + ',uk'
  var apikey = '&appid=73978c0a0da486984805d63bc449687f'
  var units = '&units=metric'
  $.get(url + apikey + units, function (data) {
    $('#city').text(city)
    $('#city-temperature').text(data.main.temp)
  })
}

function lastState () {
  $.get('http://localhost:9292/', function (data) {
    getWeather(data.lastLocation)
    thermostat.temperature = data.lastTemperature
    thermostat.powerSavingMode = data.lastPowerSaving
    temperature()
    onOff()
    colour()
  })
}

lastState()

$(document).ready(function () {
  $('#temperature-up').click(function () {
    thermostat.up()
    updateTemperature()
  })

  $('#temperature-down').click(function () {
    thermostat.down()
    updateTemperature()
  })

  $('#power-saving').click(function () {
    thermostat.togglePowerSavingMode()
    updateTemperature()
    onOff()
  })

  $('#temperature-reset').click(function () {
    thermostat.resetThermostat()
    updateTemperature()
    onOff()
  })

  $('#select-city').click(function () {
    getWeather($('#selected-city').val())
    saveState($('#selected-city').val())
  })

  function updateTemperature () {
    temperature()
    colour()
    saveState($('#city').text())
  }
})
