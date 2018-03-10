require "./spec_helper"

describe Bluetooth do
  # it "Initialize a new socket" do
  #   sock = Bluetooth::BluetoothSocket.new
  #   sock.close
  #   sock.should be_a(Bluetooth::BluetoothSocket)
  # end

  # it "Creates a FD" do
  #   sock = Bluetooth::BluetoothSocket.new
  #   sock.fd.should be_a(Int32)
  #   sock.close
  # end

  # it "connects to a device" do
  #   sock = Bluetooth::BluetoothSocket.new
  #   addr = LibC::Sockaddr.new
  #   addr.sa_family = LibC::AF_BLUETOOTH
  #   byte_add = Bluetooth::Address.new("E0:14:18:67:3D:C2")
  #   puts byte_add.inspect
  #   addr.sa_data = byte_add.byte_addr
  #   puts LibC.connect(sock.fd, pointerof(addr), 9)
  #   sock.close
  # end
end
