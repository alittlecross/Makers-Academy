'use strict'

describe('Thermostat', function () {
  var thermostat

  beforeEach(function () {
    thermostat = new Thermostat()
  })

  it('starts at 20 degrees', function () {
    expect(thermostat.temperature).toEqual(20)
  })

  it('increases in temperature with up()', function () {
    thermostat.up()
    expect(thermostat.temperature).toEqual(21)
  })

  it('decreases in temperature with down()', function () {
    thermostat.down()
    expect(thermostat.temperature).toEqual(19)
  })

  it('has a minimum of 10 degrees', function () {
    for (var i = 0; i < 11; i++) {
      thermostat.down()
    }
    expect(thermostat.temperature).toEqual(10)
  })

  it('can toggle PSM', function () {
    thermostat.togglePowerSavingMode()
    expect(thermostat.powerSavingMode).toEqual(false)
    thermostat.togglePowerSavingMode()
    expect(thermostat.powerSavingMode).toEqual(true)
  })

  it('can be reset to the default temperature', function () {
    thermostat.up()
    thermostat.resetThermostat()
    expect(thermostat.temperature).toEqual(20)
  })

  describe('when power saving mode is on', function () {
    it('has a maximum temperature of 25 degrees', function () {
      for (var i = 0; i < 6; i++) {
        thermostat.up()
      }
      expect(thermostat.temperature).toEqual(25)
    })
  })

  describe('when power saving mode is off', function () {
    it('has a maximum temperature of 32 degrees', function () {
      thermostat.powerSavingMode = false
      for (var i = 0; i < 13; i++) {
        thermostat.up()
      }
      expect(thermostat.temperature).toEqual(32)
    })
  })

  describe('displaying usage levels', function () {
    describe('when the temperature is below 18 degrees', function () {
      it('it is considered low-usage', function () {
        for (var i = 0; i < 3; i++) {
          thermostat.down()
        }
        expect(thermostat.energyUsage()).toEqual('low-usage')
      })
    })

    describe('when the temperature is between 18 and 25 degrees', function () {
      it('it is considered medium-usage', function () {
        expect(thermostat.energyUsage()).toEqual('medium-usage')
      })
    })

    describe('when the temperature is anything else', function () {
      it('it is considered high-usage', function () {
        thermostat.powerSavingMode = false
        for (var i = 0; i < 6; i++) {
          thermostat.up()
        }
        expect(thermostat.energyUsage()).toEqual('high-usage')
      })
    })
  })
})
