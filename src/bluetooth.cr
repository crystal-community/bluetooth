require "./bluetooth/**"

# TODO: Write documentation for `Bluetooth`
module Bluetooth
  def self.bswap(int : Int)
    (int >> 8) | (int << 8)
  end

  def self.set_bit(nr : Int32, addr : Void*)
    ptr = addr.as(UInt32*) + (nr >> 5)
    ptr.value |= (1 << (nr & 31))
  end

  #   static inline void hci_filter_set_ptype(int t, struct hci_filter *f)
  # {
  #         hci_set_bit((t == HCI_VENDOR_PKT) ? 0 : (t & HCI_FLT_TYPE_BITS), &f->type_mask);
  # }

  def self.filter_set_ptype(t : Int32, f : LibHCI::Filter*)
    set_bit((t == LibHCI::HCI_VENDOR_PKT) ? 0 : (t & LibHCI::HCI_FLT_TYPE_BITS), f.value.type_mask)
  end
end
