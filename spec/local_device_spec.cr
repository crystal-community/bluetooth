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

  it "Scan and connect to first device" do
    local_device = Bluetooth::LocalDevice.new
    remote_devices = local_device.scan
    remote_devices.each do |k, v|
      puts "Connecting: #{k} => #{v}"
      begin
        dev = remote_devices.first
        local_device.connect(k)
        sleep 5
        local_device.disconnect
      rescue e : Exception
        puts "Error #{e}"
        next
      end
    end
    local_device.close
  end
end
