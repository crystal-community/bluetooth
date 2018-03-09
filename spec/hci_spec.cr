require "./spec_helper"

describe Bluetooth do
  it "Initialize a new socket" do
    dev = LibHCI.get_route(nil)
    socket = LibHCI.open_dev(dev)
    LibHCI.close_dev(socket)
    (socket > -1).should eq(true)
  end

  it "scans for devices" do
    dev = LibHCI.get_route(nil)
    puts "Using dev: #{dev}"
    socket = LibHCI.open_dev(dev)
    puts "FD: #{socket}"
    len = 10
    max_rsp = 5
    flags = LibHCI::IREQ_CACHE_FLUSH
    inq_info_array = Array(LibHCI::InquiryInfo).new
    max_rsp.times do
      inq_info_array << LibHCI::InquiryInfo.new
    end
    inq_info_array_ptr = inq_info_array.to_unsafe
    num_of_devices = LibHCI.inquiry(dev, len, max_rsp, nil, pointerof(inq_info_array_ptr), flags)
    puts "found #{num_of_devices} devices near by"
    if num_of_devices > 0
      num_of_devices.times do |index|
        inq_info = inq_info_array[index]
        address = inq_info.bdaddr

        name_slice = Slice(UInt8).new(248, 0_u8)
        address_slice = Slice(UInt8).new(19, 0_u8)

        remote_addr_pointer = LibHCI.ba2str(pointerof(address), address_slice.to_unsafe)
        remote_name = LibHCI.read_remote_name(socket, pointerof(address), 248, name_slice.to_unsafe, 0)

        puts "Name: #{String.new(name_slice)}"
        puts "Addr: #{String.new(address_slice)}"
      end
    end
    LibHCI.close_dev(socket)
  end

  # void start_hci_scan(struct hci_state current_hci_state)
  # {
  #   if(hci_le_set_scan_parameters(current_hci_state.device_handle, 0x01, htobs(0x0010), htobs(0x0010), 0x00, 0x00, 1000) < 0)
  #   {
  #     current_hci_state.has_error = TRUE;
  #     snprintf(current_hci_state.error_message, sizeof(current_hci_state.error_message), "Failed to set scan parameters: %s", strerror(errno));
  #     return;
  #   }

  #   if(hci_le_set_scan_enable(current_hci_state.device_handle, 0x01, 1, 1000) < 0)
  #   {
  #     current_hci_state.has_error = TRUE;
  #     snprintf(current_hci_state.error_message, sizeof(current_hci_state.error_message), "Failed to enable scan: %s", strerror(errno));
  #     return;
  #   }

  #   current_hci_state.state = HCI_STATE_SCANNING;

  #   // Save the current HCI filter
  #   socklen_t olen = sizeof(current_hci_state.original_filter);
  #   if(getsockopt(current_hci_state.device_handle, SOL_HCI, HCI_FILTER, &current_hci_state.original_filter, &olen) < 0)
  #   {
  #     current_hci_state.has_error = TRUE;
  #     snprintf(current_hci_state.error_message, sizeof(current_hci_state.error_message), "Could not get socket options: %s", strerror(errno));
  #     return;
  #   }

  #   // Create and set the new filter
  #   struct hci_filter new_filter;

  #   hci_filter_clear(&new_filter);
  #   hci_filter_set_ptype(HCI_EVENT_PKT, &new_filter);
  #   hci_filter_set_event(EVT_LE_META_EVENT, &new_filter);

  #   if(setsockopt(current_hci_state.device_handle, SOL_HCI, HCI_FILTER, &new_filter, sizeof(new_filter)) < 0)
  #   {
  #     current_hci_state.has_error = TRUE;
  #     snprintf(current_hci_state.error_message, sizeof(current_hci_state.error_message), "Could not set socket options: %s", strerror(errno));
  #     return;
  #   }

  #   current_hci_state.state = HCI_STATE_FILTERING;
  # }
  it "scnas for BLE devices" do
    dev = LibHCI.get_route(nil)
    puts "Using dev: #{dev}"
    socket = LibHCI.open_dev(dev)
    puts "FD: #{socket}"

    # Change to BLE mode
    LibHCI.le_set_scan_parameters(dev, 0x01, Bluetooth.bswap(0x0010), Bluetooth.bswap(0x0010), 0x00, 0x00, 1000)
    LibHCI.le_set_scan_enable(dev, 0x01, 1, 1000)

    # Set new filter
    filter = LibHCI::Filter.new
    LibHCI.filter_clear(pointerof(filter))
    LibC.setsockopt(socket, LibHCI::SOL_HCI, LibHCI::)

    len = 10
    max_rsp = 5
    flags = LibHCI::IREQ_CACHE_FLUSH
    inq_info_array = Array(LibHCI::InquiryInfo).new
    max_rsp.times do
      inq_info_array << LibHCI::InquiryInfo.new
    end
    inq_info_array_ptr = inq_info_array.to_unsafe
    num_of_devices = LibHCI.inquiry(dev, len, max_rsp, nil, pointerof(inq_info_array_ptr), flags)
    puts "found #{num_of_devices} devices near by"
    if num_of_devices > 0
      num_of_devices.times do |index|
        inq_info = inq_info_array[index]
        address = inq_info.bdaddr

        name_slice = Slice(UInt8).new(248, 0_u8)
        address_slice = Slice(UInt8).new(19, 0_u8)

        remote_addr_pointer = LibHCI.ba2str(pointerof(address), address_slice.to_unsafe)
        remote_name = LibHCI.read_remote_name(socket, pointerof(address), 248, name_slice.to_unsafe, 0)

        puts "Name: #{String.new(name_slice)}"
        puts "Addr: #{String.new(address_slice)}"
      end
    end
    LibHCI.close_dev(socket)
  end
end
