require "socket"

module Bluetooth
  class BluetoothSocket < Socket
    enum Protocol
      RFCOMM = LibC::BTPROTO_RFCOMM
    end

    def initialize(type = Socket::Type::STREAM, protocol = Protocol::RFCOMM, blocking = false)
      super(
        Socket::Family.new(LibC::AF_BLUETOOTH),
        type,
        Socket::Protocol.new(protocol.value),
        blocking
      )
    end
  end
end
