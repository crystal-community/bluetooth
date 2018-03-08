require "./spec_helper"

# C Example for scanning

# int main(int argc, char **argv)
# {
#     inquiry_info *ii = NULL;
#     int max_rsp, num_rsp;
#     int dev_id, sock, len, flags;
#     int i;
#     char addr[19] = { 0 };
#     char name[248] = { 0 };

#     dev_id = hci_get_route(NULL);
#     sock = hci_open_dev( dev_id );
#     if (dev_id < 0 || sock < 0) {
#         perror("opening socket");
#         exit(1);
#     }

#     len  = 8;
#     max_rsp = 255;
#     flags = IREQ_CACHE_FLUSH;
#     ii = (inquiry_info*)malloc(max_rsp * sizeof(inquiry_info));

#     num_rsp = hci_inquiry(dev_id, len, max_rsp, NULL, &ii, flags);
#     if( num_rsp < 0 ) perror("hci_inquiry");

#     for (i = 0; i < num_rsp; i++) {
#         ba2str(&(ii+i)->bdaddr, addr);
#         memset(name, 0, sizeof(name));
#         if (hci_read_remote_name(sock, &(ii+i)->bdaddr, sizeof(name),
#             name, 0) < 0)
#         strcpy(name, "[unknown]");
#         printf("%s  %s\n", addr, name);
#     }

#     free( ii );
#     close( sock );
#     return 0;
# }

describe Bluetooth do
  it "Initialize a new socket" do
    a = 0
    dev = LibHCI.get_route(pointerof(a)) # ugly hack
    socket = LibHCI.open_dev(dev)
    LibHCI.close_dev(socket)
    (socket > -1).should eq(true)
  end

  it "scans for devices" do
    dev = LibHCI.get_route(nil)
    puts "Using dev: #{dev}"
    socket = LibHCI.open_dev(dev)
    puts "FD: #{socket}"
    len = 8
    max_rsp = 1
    flags = LibHCI::IREQ_CACHE_FLUSH
    inq_info = LibHCI::InquiryInfo.new
    scan_response = LibHCI.inquiry(dev, len, max_rsp, nil, pointerof(inq_info), flags) == 0 ? "success" : "failed"
    puts "Scan status: #{scan_response}"
    address = inq_info.bdaddr
    str = String.new
    puts "Addr: #{LibHCI.ba2str(pointerof(address), str)}"
    puts "Addr String: #{str}"
    LibHCI.close_dev(socket)
  end
end
