module Bluetooth
  class LocalDevice
    getter :socket, :dev_id

    def initialize
      @dev_id = LibHCI.get_route(nil)
      @socket = LibHCI.open_dev(@dev_id)
      raise DeviceException.new("Error binding to local device") if @dev_id < 0 || @socket < 0
    end

    def scan(scan_time : Int32 = 0, max_results : Int32 = 254) : Hash(String, String)
      respones = Hash(String, String).new
      inq_info_array = Array(LibHCI::InquiryInfo).new
      max_results.times do
        inq_info_array << LibHCI::InquiryInfo.new
      end
      inq_info_array_ptr = inq_info_array.to_unsafe
      num_of_devices = LibHCI.inquiry(@dev_id, scan_time, max_results, nil, pointerof(inq_info_array_ptr), LibHCI::IREQ_CACHE_FLUSH)
      if num_of_devices > 0
        num_of_devices.times do |index|
          inq_info = inq_info_array[index]
          address = inq_info.bdaddr

          name_slice = Slice(UInt8).new(248, 0_u8)
          address_slice = Slice(UInt8).new(19, 0_u8)

          remote_addr_pointer = LibHCI.ba2str(pointerof(address), address_slice.to_unsafe)
          remote_name = LibHCI.read_remote_name(@socket, pointerof(address), 248, name_slice.to_unsafe, 0)

          respones[String.new(address_slice)] = String.new(name_slice)
        end
      end
      respones
    end

    def le_scan(scan_time : Int32 = 0, max_results : Int32 = 254) : Hash(String, String)
      respones = Hash(String, String).new
      inq_info_array = Array(LibHCI::InquiryInfo).new
      max_results.times do
        inq_info_array << LibHCI::InquiryInfo.new
      end
      inq_info_array_ptr = inq_info_array.to_unsafe
      num_of_devices = LibHCI.inquiry(@dev_id, scan_time, max_results, nil, pointerof(inq_info_array_ptr), LibHCI::IREQ_CACHE_FLUSH)
      if num_of_devices > 0
        num_of_devices.times do |index|
          inq_info = inq_info_array[index]
          address = inq_info.bdaddr

          name_slice = Slice(UInt8).new(248, 0_u8)
          address_slice = Slice(UInt8).new(19, 0_u8)

          remote_addr_pointer = LibHCI.ba2str(pointerof(address), address_slice.to_unsafe)
          remote_name = LibHCI.read_remote_name(@socket, pointerof(address), 248, name_slice.to_unsafe, 0)

          respones[String.new(address_slice)] = String.new(name_slice)
        end
      end
      respones
    end

    def connect(address : String)
      # int hci_create_connection(int dd, const bdaddr_t *bdaddr, uint16_t ptype, uint16_t clkoffset, uint8_t rswitch, uint16_t *handle, int to);

      # if (hci_create_connection(current_hci_state.device_handle, bdaddr, htobs(di.pkt_type & ACL_PTYPE_MASK), 0, 0x01, &handle, 25000) < 0) {
      #     perror("Can't create connection");
      #     // TODO close(dd);
      #     return(-1);
      # }
      # fun str2ba = str2ba(str : LibC::Char*, ba : BdaddrT*) : LibC::Int

      # Turn string address to BdaddrT struct
      bdaddr = LibHCI::BdaddrT.new
      address_slice = address.to_slice
      LibHCI.str2ba(address_slice.to_unsafe, pointerof(bdaddr))
      LibHCI.create_connection(@socket, pointerof(bdaddr))
    end

    def disconnect
    end

    def close
      LibHCI.close_dev(@socket)
    end
  end
end
