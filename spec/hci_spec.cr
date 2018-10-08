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

  #   int done = 0;
  #   int error = 0;
  #   while (!done && !error)
  #   {
  #     int len = 0;
  #     unsigned char buf[HCI_MAX_EVENT_SIZE];
  #     while ((len = read(current_hci_state.device_handle, buf, sizeof(buf))) < 0)
  #     {
  #       if (errno == EINTR || errno == EAGAIN)
  #       {
  #         continue;
  #       }
  #       error = 1;
  #     }

  #     if (!done && !error)
  #     {
  #       evt_le_meta_event *meta = (evt_le_meta_event*)(((uint8_t *)&buf) + (1 + HCI_EVENT_HDR_SIZE));

  #       len -= (1 + HCI_EVENT_HDR_SIZE);

  #       if (meta->subevent != EVT_LE_ADVERTISING_REPORT)
  #       {
  #         cout << "continue" << endl;
  #         continue;
  #       }

  #       le_advertising_info *info = (le_advertising_info *) (meta->data + 1);

  #       cout << "Event: " << (int)info->evt_type << endl;
  #       cout << "Length: " << (int)info->length << endl;

  #       if (info->length == 0)
  #       {
  #         continue;
  #       }

  #       int current_index = 0;
  #       int data_error = 0;

  #       while (!data_error && current_index < info->length)
  #       {
  #         size_t data_len = info->data[current_index];

  #         if (data_len + 1 > info->length)
  #         {
  #           cout << "EIR data length is longer than EIR packet length. " << data_len << "+ 1 > " << info->length << endl;
  #           data_error = 1;
  #         }
  #         else
  #         {
  #           process_data((uint8_t *)(((uint8_t *)&info->data) + current_index + 1), data_len, info);
  #           //get_rssi(&info->bdaddr, current_hci_state);
  #           current_index += data_len + 1;
  #         }
  #       }
  #     }
  #   }

  #   if (error)
  #   {
  #     cout << "Error scanning." << endl;
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

    LibC.memset(pointerof(filter), 0, sizeof(LibHCI::Filter))
    puts "after memset"
    Bluetooth.filter_set_ptype(LibHCI::HCI_EVENT_PKT, pointerof(filter))
    puts "after filter set"
    Bluetooth.filter_set_event(LibHCI::EVT_LE_META_EVENT, pointerof(filter))
    puts "after set event"
    LibC.setsockopt(socket, LibHCI::SOL_HCI, LibHCI::HCI_FILTER, pointerof(filter), sizeof(LibHCI::Filter))
    puts "after set socket"

    # Loop and scan
    loop do
      buf = Bytes.new(LibHCI::HCI_MAX_EVENT_SIZE)
      while (LibC.read(socket, buf, 5) < 0)
        a = Errno.new("")
        if a.is_a?(Errno::EINTR) || a.is_a?(Errno::EAGAIN)
          puts "Try again: #{a}"
          sleep 2
          next
        else
          raise Bluetooth::RawReadException.new("Error reading from socket: #{a}")
        end
      end
      puts "Got back a response: #{buf}"
      puts "Stringfy: #{String.new(buf)}"
      # # evt_le_meta_event *meta = (evt_le_meta_event*)(((uint8_t *)&buf) + (1 + HCI_EVENT_HDR_SIZE));
      # meta = Pointer(LibHCI::EvtLeMetaEven).new()
      break
    end

    LibHCI.close_dev(socket)
  end
end
