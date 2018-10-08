require "./bluetooth/**"

# TODO: Write documentation for `Bluetooth`
module Bluetooth
  def self.bswap(int : Int)
    (int >> 8) | (int << 8)
  end

  # static inline void hci_set_bit(int nr, void *addr)
  # {
  # *((uint32_t *) addr + (nr >> 5)) |= (1 << (nr & 31));
  # }

  def self.set_bit(nr : Int32, addr : Void*)
    ptr = addr.as(LibC::UInt32T*) + (nr >> 5)
    ptr.value |= (1 << (nr & 31))
  end

  # static inline void hci_filter_set_ptype(int t, struct hci_filter *f)
  # {
  #         hci_set_bit((t == HCI_VENDOR_PKT) ? 0 : (t & HCI_FLT_TYPE_BITS), &f->type_mask);
  # }

  def self.filter_set_ptype(t : Int32, f : LibHCI::Filter*)
    a = f.value.type_mask
    ptr = pointerof(a)
    set_bit((t == LibHCI::HCI_VENDOR_PKT) ? 0 : (t & LibHCI::HCI_FLT_TYPE_BITS), ptr.as(Pointer(Void)))
  end

  #   static inline void hci_filter_set_event(int e, struct hci_filter *f)
  # {
  #         hci_set_bit((e & HCI_FLT_EVENT_BITS), &f->event_mask);
  # }

  def self.filter_set_event(e : Int32, f : LibHCI::Filter*)
    a = f.value.event_mask
    ptr = pointerof(a)
    set_bit((e & LibHCI::HCI_FLT_EVENT_BITS), ptr.as(Pointer(Void)))
  end
end
