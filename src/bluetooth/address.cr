module Bluetooth
  class Address
    getter :byte_addr
    @byte_addr : StaticArray(UInt8, 14)

    def initialize(bt_addr : String)
      channel = 1
      bytes = bt_addr.split(/:/).map { |x| x.to_i(16) }
      static = StaticArray(Int32 | UInt16 | UInt8, 14).new 0
      static[0] = LibC::AF_BLUETOOTH
      static[1] = 0
      bytes.reverse.each_with_index do |b, i|
        static[i + 2] = b
      end
      static[8] = channel
      static[9] = 0
      puts static
      # @byte_addr = [LibC::AF_BLUETOOTH, 0, bytes.reverse, channel, 0]
      @byte_addr = static.map { |i| i.to_u8 }
    end
  end
end
