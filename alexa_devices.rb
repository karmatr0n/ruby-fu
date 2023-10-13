# Design OOPs for Amazon Alexa devices.

# Echo Show, Echo Dot and, Amazon Echo.
#  These devices have different input(typing, voice), output(sound, display) and power(battery, plug-in) mode.
#
# Your Design should be able to handle different input & must respond with the correct output when
# Alexa is asked about its battery status(i.e X% charged or plugged-in).

# Which of those devices support batteries?
# How alexa is going to give the instructions each device?
# using JSON
require 'test/unit'

class Battery
  attr_reader :power

  def initialize
    @power = 0
  end

  def full?
    @power == 100
  end

  def increase_charge
    @power += 1 unless full?
  end

  def power_available?
    @power > 1
  end

  def status
    "#{@battery.power}% charged"
  end
end

class PowerAdapter
    attr_accessor :power_input

    def initialize
      @power_input = true
    end

    def connected?
      power_input
    end
end

class Device
  attr_accessor :power_adapter

  def initialize
    @power_adapter = PowerAdapter.new
  end

  def power_status
    {status: 'plugged-in' } if power_adapter.connected?
  end

  def input
    abort "implement the input method for this device"
  end
end

class AmazonEcho < Device
  def input(command:, options:{})
    power_status if command == 'power_status'
  end
end

class AmazonEcho < Device
  def input(command:, options:{})
    power_status if command == 'power_status'
  end
end

class AmazonEchoTap < Device
  attr_accessor :battery

  def initialize
    super
    @battery = Battery.new
  end

  def battery_status
    return power_status if power_adapter.connected?
    {status: "#{@battery.power}% charged"}
  end

  def input(command:, options:{})
    battery_status if command == 'battery_status'
  end
end

class TestAmazonEchoTap < Test::Unit::TestCase
  def test_echo_tap_with_power_adapter
    device = AmazonEchoTap.new
    assert_equal({status: 'plugged-in'}, device.input(command: 'battery_status'))
  end

  def test_echo_tap_with_battery
    device = AmazonEchoTap.new
    device.power_adapter.power_input = false
    10.times do
      device.battery.increase_charge
    end
    assert_equal({status: '10% charged'}, device.input(command: 'battery_status'))
  end
end
