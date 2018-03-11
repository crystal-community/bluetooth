module Bluetooth
  class LocalDevice
    getter :socket, :dev_id

    def initialize
      @dev_id = LibHCI.get_route(nil)
      @socket = LibHCI.open_dev(@dev_id)
      raise DeviceException.new("Error binding to local device") if @dev_id < 0 || @socket < 0
    end

    def scan(scan_time : Int32 = 8, max_results : Int32 = 254) : Hash(String, String)
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
      bdaddr = LibHCI::BdaddrT.new
      address_slice = address.to_slice
      LibHCI.str2ba(address_slice.to_unsafe, pointerof(bdaddr))
      dev_info = get_dev_info
      handle = 0_u16
      resp = LibHCI.create_connection(@socket, pointerof(bdaddr), Bluetooth.bswap(dev_info.pkt_type & LibHCI::ACL_PTYPE_MASK), 0, 0x01, pointerof(handle), 25000)
      raise DeviceException.new("Error connecting to device: #{address}") unless resp == 0
    end

    def disconnect
      #   fun disconnect = hci_disconnect(dd : LibC::Int, handle : LibC::Int, reason : LibC::Int, to : LibC::Int) : LibC::Int
      handle = 0_u16
      resp = LibHCI.disconnect(@socket, handle, 0, 25000)
      raise DeviceException.new("Error disconnecting from remote device")
    end

    def close
      LibHCI.close_dev(@socket)
    end

    private def get_dev_info : LibHCI::DevInfo
      dev_info = LibHCI::DevInfo.new
      resp = LibHCI.devinfo(@dev_id, pointerof(dev_info))
      raise DeviceException.new("Error getting device info") unless resp == 0
      dev_info
    end
  end
end
