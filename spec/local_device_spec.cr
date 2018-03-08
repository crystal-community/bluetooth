require "./spec_helper"

describe Bluetooth::LocalDevice do
  it "Initialize" do
    local_device = Bluetooth::LocalDevice.new
    local_device.close
    local_device.should be_a(Bluetooth::LocalDevice)
  end

  it "Scans for remote devices" do
    local_device = Bluetooth::LocalDevice.new
    remote_devices = local_device.scan
    local_device.close
    remote_devices.should be_a(Hash(String, String))
  end
end
