require "./bluetooth/**"

# TODO: Write documentation for `Bluetooth`
module Bluetooth
  def self.bswap(int : Int)
    (int >> 8) | (int << 8)
  end
end
