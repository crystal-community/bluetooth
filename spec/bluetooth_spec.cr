require "./spec_helper"

describe Bluetooth do
  it "Initialize a new socket" do
    sock = Bluetooth::BluetoothSocket.new
    sock.close
    sock.should be_a(Bluetooth::BluetoothSocket)
  end
end
