@[Link("bluetooth")]
lib LibHCI
  Connected          =    1
  Open               =    2
  Bound              =    3
  Listen             =    4
  Connect            =    5
  Connect2           =    6
  Config             =    7
  Disconn            =    8
  Closed             =    9
  Up                 =    0
  Init               =    1
  Running            =    2
  Pscan              =    3
  Iscan              =    4
  Auth               =    5
  Encrypt            =    6
  Inquiry            =    7
  Raw                =    8
  IREQ_CACHE_FLUSH   =    1
  SOL_HCI            =    0
  SOL_L2CAP          =    6
  SOL_SCO            =   17
  SOL_RFCOMM         =   18
  HCI_FILTER         =    2
  EVT_LE_META_EVENT  = 0x3E
  HCI_COMMAND_PKT    = 0x01
  HCI_ACLDATA_PKT    = 0x02
  HCI_SCODATA_PKT    = 0x03
  HCI_EVENT_PKT      = 0x04
  HCI_VENDOR_PKT     = 0xff
  HCI_FLT_TYPE_BITS  =   31
  HCI_FLT_EVENT_BITS =   63
  HCI_FLT_OGF_BITS   =   63
  HCI_FLT_OCF_BITS   =  127
  HCI_MAX_EVENT_SIZE =  260
  MAX_EVENT_SIZE     =  260

  # HCI Packet types
  HCI_2DH1 = 0x0002
  HCI_3DH1 = 0x0004
  HCI_DM1  = 0x0008
  HCI_DH1  = 0x0010
  HCI_2DH3 = 0x0100
  HCI_3DH3 = 0x0200
  HCI_DM3  = 0x0400
  HCI_DH3  = 0x0800
  HCI_2DH5 = 0x1000
  HCI_3DH5 = 0x2000
  HCI_DM5  = 0x4000
  HCI_DH5  = 0x8000

  HCI_HV1 = 0x0020
  HCI_HV2 = 0x0040
  HCI_HV3 = 0x0080

  HCI_EV3  = 0x0008
  HCI_EV4  = 0x0010
  HCI_EV5  = 0x0020
  HCI_2EV3 = 0x0040
  HCI_3EV3 = 0x0080
  HCI_2EV5 = 0x0100
  HCI_3EV5 = 0x0200

  SCO_PTYPE_MASK = HCI_HV1 | HCI_HV2 | HCI_HV3
  ACL_PTYPE_MASK = HCI_DM1 | HCI_DH1 | HCI_DM3 | HCI_DH3 | HCI_DM5 | HCI_DH5

  # Baseband links
  SCO_LINK  = 0x00
  ACL_LINK  = 0x01
  ESCO_LINK = 0x02

  # TODO make sure this makes sense
  HCIGETCONNINFO = -2147202860.to_u32

  # BLE
  UNKNOWN_COMMAND                            =     1
  NO_CONNECTION                              =     2
  HARDWARE_FAILURE                           =     3
  PAGE_TIMEOUT                               =     4
  AUTHENTICATION_FAILURE                     =     5
  PIN_OR_KEY_MISSING                         =     6
  MEMORY_FULL                                =     7
  CONNECTION_TIMEOUT                         =     8
  MAX_NUMBER_OF_CONNECTIONS                  =     9
  MAX_NUMBER_OF_SCO_CONNECTIONS              =    10
  ACL_CONNECTION_EXISTS                      =    11
  COMMAND_DISALLOWED                         =    12
  REJECTED_LIMITED_RESOURCES                 =    13
  REJECTED_SECURITY                          =    14
  REJECTED_PERSONAL                          =    15
  HOST_TIMEOUT                               =    16
  UNSUPPORTED_FEATURE                        =    17
  INVALID_PARAMETERS                         =    18
  OE_USER_ENDED_CONNECTION                   =    19
  OE_LOW_RESOURCES                           =    20
  OE_POWER_OFF                               =    21
  CONNECTION_TERMINATED                      =    22
  REPEATED_ATTEMPTS                          =    23
  PAIRING_NOT_ALLOWED                        =    24
  UNKNOWN_LMP_PDU                            =    25
  UNSUPPORTED_REMOTE_FEATURE                 =    26
  SCO_OFFSET_REJECTED                        =    27
  SCO_INTERVAL_REJECTED                      =    28
  AIR_MODE_REJECTED                          =    29
  INVALID_LMP_PARAMETERS                     =    30
  UNSPECIFIED_ERROR                          =    31
  UNSUPPORTED_LMP_PARAMETER_VALUE            =    32
  ROLE_CHANGE_NOT_ALLOWED                    =    33
  LMP_RESPONSE_TIMEOUT                       =    34
  LMP_ERROR_TRANSACTION_COLLISION            =    35
  LMP_PDU_NOT_ALLOWED                        =    36
  ENCRYPTION_MODE_NOT_ACCEPTED               =    37
  UNIT_LINK_KEY_USED                         =    38
  QOS_NOT_SUPPORTED                          =    39
  INSTANT_PASSED                             =    40
  PAIRING_NOT_SUPPORTED                      =    41
  TRANSACTION_COLLISION                      =    42
  QOS_UNACCEPTABLE_PARAMETER                 =    44
  QOS_REJECTED                               =    45
  CLASSIFICATION_NOT_SUPPORTED               =    46
  INSUFFICIENT_SECURITY                      =    47
  PARAMETER_OUT_OF_RANGE                     =    48
  ROLE_SWITCH_PENDING                        =    50
  SLOT_VIOLATION                             =    52
  ROLE_SWITCH_FAILED                         =    53
  EIR_TOO_LARGE                              =    54
  SIMPLE_PAIRING_NOT_SUPPORTED               =    55
  HOST_BUSY_PAIRING                          =    56
  START_NO_FLUSH                             =     0
  CONT                                       =     1
  START                                      =     2
  ACTIVE_BCAST                               =     4
  PICO_BCAST                                 =     8
  LINK                                       =     1
  LP_RSWITCH                                 =     1
  LP_HOLD                                    =     2
  LP_SNIFF                                   =     4
  LP_PARK                                    =     8
  LM_ACCEPT                                  = 32768
  LM_MASTER                                  =     1
  LM_AUTH                                    =     2
  LM_ENCRYPT                                 =     4
  LM_TRUSTED                                 =     8
  LM_RELIABLE                                =    16
  LM_SECURE                                  =    32
  LK_COMBINATION                             =     0
  LK_LOCAL_UNIT                              =     1
  LK_REMOTE_UNIT                             =     2
  LK_DEBUG_COMBINATION                       =     3
  LK_UNAUTH_COMBINATION                      =     4
  LK_AUTH_COMBINATION                        =     5
  LK_CHANGED_COMBINATION                     =     6
  LK_INVALID                                 =   255
  QOS_CP_SIZE                                =    17
  MAX_NAME_LENGTH                            =   248
  MAX_EIR_LENGTH                             =   240
  INQUIRY_COMPLETE                           =     1
  INQUIRY_RESULT                             =     2
  CONN_COMPLETE                              =     3
  CONN_COMPLETE_SIZE                         =    11
  CONN_REQUEST                               =     4
  CONN_REQUEST_SIZE                          =    10
  DISCONN_COMPLETE                           =     5
  DISCONN_COMPLETE_SIZE                      =     4
  AUTH_COMPLETE                              =     6
  AUTH_COMPLETE_SIZE                         =     3
  REMOTE_NAME_REQ_COMPLETE                   =     7
  REMOTE_NAME_REQ_COMPLETE_SIZE              =   255
  ENCRYPT_CHANGE                             =     8
  ENCRYPT_CHANGE_SIZE                        =     4
  CHANGE_CONN_LINK_KEY_COMPLETE              =     9
  CHANGE_CONN_LINK_KEY_COMPLETE_SIZE         =     3
  MASTER_LINK_KEY_COMPLETE                   =    10
  MASTER_LINK_KEY_COMPLETE_SIZE              =     4
  READ_REMOTE_FEATURES_COMPLETE              =    11
  READ_REMOTE_FEATURES_COMPLETE_SIZE         =    11
  READ_REMOTE_VERSION_COMPLETE               =    12
  READ_REMOTE_VERSION_COMPLETE_SIZE          =     8
  QOS_SETUP_COMPLETE                         =    13
  CMD_COMPLETE                               =    14
  CMD_COMPLETE_SIZE                          =     3
  CMD_STATUS                                 =    15
  CMD_STATUS_SIZE                            =     4
  HARDWARE_ERROR                             =    16
  HARDWARE_ERROR_SIZE                        =     1
  FLUSH_OCCURRED                             =    17
  FLUSH_OCCURRED_SIZE                        =     2
  ROLE_CHANGE                                =    18
  ROLE_CHANGE_SIZE                           =     8
  NUM_COMP_PKTS                              =    19
  NUM_COMP_PKTS_SIZE                         =     1
  MODE_CHANGE                                =    20
  MODE_CHANGE_SIZE                           =     6
  RETURN_LINK_KEYS                           =    21
  RETURN_LINK_KEYS_SIZE                      =     1
  PIN_CODE_REQ                               =    22
  PIN_CODE_REQ_SIZE                          =     6
  LINK_KEY_REQ                               =    23
  LINK_KEY_REQ_SIZE                          =     6
  LINK_KEY_NOTIFY                            =    24
  LINK_KEY_NOTIFY_SIZE                       =    23
  LOOPBACK_COMMAND                           =    25
  DATA_BUFFER_OVERFLOW                       =    26
  DATA_BUFFER_OVERFLOW_SIZE                  =     1
  MAX_SLOTS_CHANGE                           =    27
  MAX_SLOTS_CHANGE_SIZE                      =     3
  READ_CLOCK_OFFSET_COMPLETE                 =    28
  READ_CLOCK_OFFSET_COMPLETE_SIZE            =     5
  CONN_PTYPE_CHANGED                         =    29
  CONN_PTYPE_CHANGED_SIZE                    =     5
  QOS_VIOLATION                              =    30
  QOS_VIOLATION_SIZE                         =     2
  PSCAN_REP_MODE_CHANGE                      =    32
  PSCAN_REP_MODE_CHANGE_SIZE                 =     7
  FLOW_SPEC_COMPLETE                         =    33
  INQUIRY_RESULT_WITH_RSSI                   =    34
  READ_REMOTE_EXT_FEATURES_COMPLETE          =    35
  READ_REMOTE_EXT_FEATURES_COMPLETE_SIZE     =    13
  SYNC_CONN_COMPLETE                         =    44
  SYNC_CONN_COMPLETE_SIZE                    =    17
  SYNC_CONN_CHANGED                          =    45
  SYNC_CONN_CHANGED_SIZE                     =     9
  SNIFF_SUBRATING                            =    46
  SNIFF_SUBRATING_SIZE                       =    11
  EXTENDED_INQUIRY_RESULT                    =    47
  ENCRYPTION_KEY_REFRESH_COMPLETE            =    48
  ENCRYPTION_KEY_REFRESH_COMPLETE_SIZE       =     3
  IO_CAPABILITY_REQUEST                      =    49
  IO_CAPABILITY_REQUEST_SIZE                 =     6
  IO_CAPABILITY_RESPONSE                     =    50
  IO_CAPABILITY_RESPONSE_SIZE                =     9
  USER_CONFIRM_REQUEST                       =    51
  USER_CONFIRM_REQUEST_SIZE                  =    10
  USER_PASSKEY_REQUEST                       =    52
  USER_PASSKEY_REQUEST_SIZE                  =     6
  REMOTE_OOB_DATA_REQUEST                    =    53
  REMOTE_OOB_DATA_REQUEST_SIZE               =     6
  SIMPLE_PAIRING_COMPLETE                    =    54
  SIMPLE_PAIRING_COMPLETE_SIZE               =     7
  LINK_SUPERVISION_TIMEOUT_CHANGED           =    56
  LINK_SUPERVISION_TIMEOUT_CHANGED_SIZE      =     4
  ENHANCED_FLUSH_COMPLETE                    =    57
  ENHANCED_FLUSH_COMPLETE_SIZE               =     2
  USER_PASSKEY_NOTIFY                        =    59
  USER_PASSKEY_NOTIFY_SIZE                   =    10
  KEYPRESS_NOTIFY                            =    60
  KEYPRESS_NOTIFY_SIZE                       =     7
  REMOTE_HOST_FEATURES_NOTIFY                =    61
  REMOTE_HOST_FEATURES_NOTIFY_SIZE           =    14
  LE_META_EVENT                              =    62
  LE_META_EVENT_SIZE                         =     1
  LE_CONN_COMPLETE                           =     1
  LE_CONN_COMPLETE_SIZE                      =    18
  LE_ADVERTISING_REPORT                      =     2
  LE_CONN_UPDATE_COMPLETE                    =     3
  LE_CONN_UPDATE_COMPLETE_SIZE               =     9
  LE_READ_REMOTE_USED_FEATURES_COMPLETE      =     4
  LE_READ_REMOTE_USED_FEATURES_COMPLETE_SIZE =    11
  LE_LTK_REQUEST                             =     5
  LE_LTK_REQUEST_SIZE                        =    12
  PHYSICAL_LINK_COMPLETE                     =    64
  PHYSICAL_LINK_COMPLETE_SIZE                =     2
  CHANNEL_SELECTED                           =    65
  DISCONNECT_PHYSICAL_LINK_COMPLETE          =    66
  DISCONNECT_PHYSICAL_LINK_COMPLETE_SIZE     =     3
  PHYSICAL_LINK_LOSS_EARLY_WARNING           =    67
  PHYSICAL_LINK_LOSS_WARNING_SIZE            =     2
  PHYSICAL_LINK_RECOVERY                     =    68
  PHYSICAL_LINK_RECOVERY_SIZE                =     1
  LOGICAL_LINK_COMPLETE                      =    69
  LOGICAL_LINK_COMPLETE_SIZE                 =     5
  DISCONNECT_LOGICAL_LINK_COMPLETE           =    70
  FLOW_SPEC_MODIFY_COMPLETE                  =    71
  FLOW_SPEC_MODIFY_COMPLETE_SIZE             =     3
  NUMBER_COMPLETED_BLOCKS                    =    72
  AMP_STATUS_CHANGE                          =    77
  AMP_STATUS_CHANGE_SIZE                     =     2
  TESTING                                    =   254
  VENDOR                                     =   255
  STACK_INTERNAL                             =   253
  STACK_INTERNAL_SIZE                        =     2
  SI_DEVICE                                  =     1
  SI_DEVICE_SIZE                             =     4
  TYPE_LEN                                   =     1
  COMMAND_HDR_SIZE                           =     3
  EVENT_HDR_SIZE                             =     2
  ACL_HDR_SIZE                               =     4
  SCO_HDR_SIZE                               =     3
  MSG_HDR_SIZE                               =     6
  DATA_DIR                                   =     1
  FILTER                                     =     2
  TIME_STAMP                                 =     3
  CMSG_DIR                                   =     1
  CMSG_TSTAMP                                =     2
  DEV_NONE                                   = 65535
  CHANNEL_RAW                                =     0
  CHANNEL_USER                               =     1
  CHANNEL_MONITOR                            =     2
  CHANNEL_CONTROL                            =     3
  CHANNEL_LOGGING                            =     4
  FLT_TYPE_BITS                              =    31
  FLT_EVENT_BITS                             =    63
  FLT_OGF_BITS                               =    63
  FLT_OCF_BITS                               =   127
  CACHE_FLUSH                                =     1

  struct Security
    level : Uint8T
    key_size : Uint8T
  end

  struct Power
    force_active : Uint8T
  end

  struct Voice
    setting : Uint16T
  end

  struct Filter
    type_mask : Uint32T
    event_mask : Uint32T[2]
    opcode : Uint16T
  end

  struct DevStats
    err_rx : Uint32T
    err_tx : Uint32T
    cmd_tx : Uint32T
    evt_rx : Uint32T
    acl_tx : Uint32T
    acl_rx : Uint32T
    sco_tx : Uint32T
    sco_rx : Uint32T
    byte_rx : Uint32T
    byte_tx : Uint32T
  end

  struct DevInfo
    dev_id : Uint16T
    name : LibC::Char[8]
    bdaddr : BdaddrT
    flags : Uint32T
    type : Uint8T
    features : Uint8T[8]
    pkt_type : Uint32T
    link_policy : Uint32T
    link_mode : Uint32T
    acl_mtu : Uint16T
    acl_pkts : Uint16T
    sco_mtu : Uint16T
    sco_pkts : Uint16T
    stat : DevStats
  end

  struct BdaddrT
    b : Uint8T[6]
  end

  struct ConnInfo
    handle : Uint16T
    bdaddr : BdaddrT
    type : Uint8T
    out : Uint8T
    state : Uint16T
    link_mode : Uint32T
  end

  struct ConnInfoReq
    bdaddr : BdaddrT
    type : Uint8T
    conn_info : ConnInfo[0]
  end

  @[Packed]
  struct EvtLeMetaEvent
    subevent : Uint8T
    data : Uint8T
  end

  @[Packed]
  struct HCIGetConnInfoPair
    request : ConnInfoReq
    response : ConnInfo
  end

  struct DevReq
    dev_id : Uint16T
    dev_opt : Uint32T
  end

  struct DevListReq
    dev_num : Uint16T
    dev_req : DevReq[0]
  end

  struct ConnListReq
    dev_id : Uint16T
    conn_num : Uint16T
    conn_info : ConnInfo[0]
  end

  struct AuthInfoReq
    bdaddr : BdaddrT
    type : Uint8T
  end

  @[Packed]
  struct InquiryInfo
    bdaddr : BdaddrT
    pscan_rep_mode : Uint8T
    pscan_period_mode : Uint8T
    pscan_mode : Uint8T
    dev_class : Uint8T[3]
    clock_offset : Uint16T
  end

  struct InquiryReq
    dev_id : Uint16T
    flags : Uint16T
    lap : Uint8T[3]
    length : Uint8T
    num_rsp : Uint8T
  end

  struct Request
    ogf : LibC::Int
    ocf : LibC::Int
    event : LibC::Int
    cparam : Void*
    clen : LibC::Int
    rparam : Void*
    rlen : LibC::Int
  end

  struct Version
    manufacturer : LibC::Int
    ver : LibC::Int
    rev : LibC::Int
    lmp_ver : LibC::Int
    lmp_subver : LibC::Int
  end

  alias X__Uint16T = LibC::UShort
  alias Uint16T = X__Uint16T
  alias X__Uint32T = LibC::UInt
  alias Uint32T = X__Uint32T
  alias X__Uint64T = LibC::ULong
  alias Uint64T = X__Uint64T
  alias X__Uint8T = UInt8
  alias Uint8T = X__Uint8T

  fun open_dev = hci_open_dev(dev_id : LibC::Int) : LibC::Int
  fun close_dev = hci_close_dev(dd : LibC::Int) : LibC::Int
  fun send_cmd = hci_send_cmd(dd : LibC::Int, ogf : LibC::Int, ocf : LibC::Int, plen : LibC::Int, param : Void*) : LibC::Int
  fun send_req = hci_send_req(dd : LibC::Int, req : Request*, timeout : LibC::Int) : LibC::Int
  fun create_connection = hci_create_connection(dd : LibC::Int, bdaddr : BdaddrT*, ptype : LibC::Int, clkoffset : LibC::Int, rswitch : LibC::Int, handle : LibC::UInt16T*, to : LibC::Int) : LibC::Int
  fun disconnect = hci_disconnect(dd : LibC::Int, handle : LibC::Int, reason : LibC::Int, to : LibC::Int) : LibC::Int
  fun inquiry = hci_inquiry(dev_id : LibC::Int, len : LibC::Int, num_rsp : LibC::Int, lap : LibC::Int*, ii : InquiryInfo**, flags : LibC::Long) : LibC::Int
  fun devinfo = hci_devinfo(dev_id : LibC::Int, di : DevInfo*) : LibC::Int
  fun devba = hci_devba(dev_id : LibC::Int, bdaddr : LibC::Int*) : LibC::Int
  fun devid = hci_devid(str : LibC::Char*) : LibC::Int
  fun read_local_name = hci_read_local_name(dd : LibC::Int, len : LibC::Int, name : LibC::Char*, to : LibC::Int) : LibC::Int
  fun write_local_name = hci_write_local_name(dd : LibC::Int, name : LibC::Char*, to : LibC::Int) : LibC::Int
  fun read_remote_name = hci_read_remote_name(dd : LibC::Int, bdaddr : BdaddrT*, len : LibC::Int, name : LibC::Char*, to : LibC::Int) : LibC::Int
  fun read_remote_name_with_clock_offset = hci_read_remote_name_with_clock_offset(dd : LibC::Int, bdaddr : LibC::Int*, pscan_rep_mode : LibC::Int, clkoffset : LibC::Int, len : LibC::Int, name : LibC::Char*, to : LibC::Int) : LibC::Int
  fun read_remote_name_cancel = hci_read_remote_name_cancel(dd : LibC::Int, bdaddr : LibC::Int*, to : LibC::Int) : LibC::Int
  fun read_remote_version = hci_read_remote_version(dd : LibC::Int, handle : LibC::Int, ver : Version*, to : LibC::Int) : LibC::Int
  fun read_remote_features = hci_read_remote_features(dd : LibC::Int, handle : LibC::Int, features : LibC::Int*, to : LibC::Int) : LibC::Int
  fun read_remote_ext_features = hci_read_remote_ext_features(dd : LibC::Int, handle : LibC::Int, page : LibC::Int, max_page : LibC::Int*, features : LibC::Int*, to : LibC::Int) : LibC::Int
  fun read_clock_offset = hci_read_clock_offset(dd : LibC::Int, handle : LibC::Int, clkoffset : LibC::Int*, to : LibC::Int) : LibC::Int
  fun read_local_version = hci_read_local_version(dd : LibC::Int, ver : Version*, to : LibC::Int) : LibC::Int
  fun read_local_commands = hci_read_local_commands(dd : LibC::Int, commands : LibC::Int*, to : LibC::Int) : LibC::Int
  fun read_local_features = hci_read_local_features(dd : LibC::Int, features : LibC::Int*, to : LibC::Int) : LibC::Int
  fun read_local_ext_features = hci_read_local_ext_features(dd : LibC::Int, page : LibC::Int, max_page : LibC::Int*, features : LibC::Int*, to : LibC::Int) : LibC::Int
  fun read_bd_addr = hci_read_bd_addr(dd : LibC::Int, bdaddr : LibC::Int*, to : LibC::Int) : LibC::Int
  fun read_class_of_dev = hci_read_class_of_dev(dd : LibC::Int, cls : LibC::Int*, to : LibC::Int) : LibC::Int
  fun write_class_of_dev = hci_write_class_of_dev(dd : LibC::Int, cls : LibC::Int, to : LibC::Int) : LibC::Int
  fun read_voice_setting = hci_read_voice_setting(dd : LibC::Int, vs : LibC::Int*, to : LibC::Int) : LibC::Int
  fun write_voice_setting = hci_write_voice_setting(dd : LibC::Int, vs : LibC::Int, to : LibC::Int) : LibC::Int
  fun read_current_iac_lap = hci_read_current_iac_lap(dd : LibC::Int, num_iac : LibC::Int*, lap : LibC::Int*, to : LibC::Int) : LibC::Int
  fun write_current_iac_lap = hci_write_current_iac_lap(dd : LibC::Int, num_iac : LibC::Int, lap : LibC::Int*, to : LibC::Int) : LibC::Int
  fun read_stored_link_key = hci_read_stored_link_key(dd : LibC::Int, bdaddr : LibC::Int*, all : LibC::Int, to : LibC::Int) : LibC::Int
  fun write_stored_link_key = hci_write_stored_link_key(dd : LibC::Int, bdaddr : LibC::Int*, key : LibC::Int*, to : LibC::Int) : LibC::Int
  fun delete_stored_link_key = hci_delete_stored_link_key(dd : LibC::Int, bdaddr : LibC::Int*, all : LibC::Int, to : LibC::Int) : LibC::Int
  fun authenticate_link = hci_authenticate_link(dd : LibC::Int, handle : LibC::Int, to : LibC::Int) : LibC::Int
  fun encrypt_link = hci_encrypt_link(dd : LibC::Int, handle : LibC::Int, encrypt : LibC::Int, to : LibC::Int) : LibC::Int
  fun change_link_key = hci_change_link_key(dd : LibC::Int, handle : LibC::Int, to : LibC::Int) : LibC::Int
  fun switch_role = hci_switch_role(dd : LibC::Int, bdaddr : LibC::Int*, role : LibC::Int, to : LibC::Int) : LibC::Int
  fun park_mode = hci_park_mode(dd : LibC::Int, handle : LibC::Int, max_interval : LibC::Int, min_interval : LibC::Int, to : LibC::Int) : LibC::Int
  fun exit_park_mode = hci_exit_park_mode(dd : LibC::Int, handle : LibC::Int, to : LibC::Int) : LibC::Int
  fun read_inquiry_scan_type = hci_read_inquiry_scan_type(dd : LibC::Int, type : LibC::Int*, to : LibC::Int) : LibC::Int
  fun write_inquiry_scan_type = hci_write_inquiry_scan_type(dd : LibC::Int, type : LibC::Int, to : LibC::Int) : LibC::Int
  fun read_inquiry_mode = hci_read_inquiry_mode(dd : LibC::Int, mode : LibC::Int*, to : LibC::Int) : LibC::Int
  fun write_inquiry_mode = hci_write_inquiry_mode(dd : LibC::Int, mode : LibC::Int, to : LibC::Int) : LibC::Int
  fun read_afh_mode = hci_read_afh_mode(dd : LibC::Int, mode : LibC::Int*, to : LibC::Int) : LibC::Int
  fun write_afh_mode = hci_write_afh_mode(dd : LibC::Int, mode : LibC::Int, to : LibC::Int) : LibC::Int
  fun read_ext_inquiry_response = hci_read_ext_inquiry_response(dd : LibC::Int, fec : LibC::Int*, data : LibC::Int*, to : LibC::Int) : LibC::Int
  fun write_ext_inquiry_response = hci_write_ext_inquiry_response(dd : LibC::Int, fec : LibC::Int, data : LibC::Int*, to : LibC::Int) : LibC::Int
  fun read_simple_pairing_mode = hci_read_simple_pairing_mode(dd : LibC::Int, mode : LibC::Int*, to : LibC::Int) : LibC::Int
  fun write_simple_pairing_mode = hci_write_simple_pairing_mode(dd : LibC::Int, mode : LibC::Int, to : LibC::Int) : LibC::Int
  fun read_local_oob_data = hci_read_local_oob_data(dd : LibC::Int, hash : LibC::Int*, randomizer : LibC::Int*, to : LibC::Int) : LibC::Int
  fun read_inq_response_tx_power_level = hci_read_inq_response_tx_power_level(dd : LibC::Int, level : LibC::Int*, to : LibC::Int) : LibC::Int
  fun read_inquiry_transmit_power_level = hci_read_inquiry_transmit_power_level(dd : LibC::Int, level : LibC::Int*, to : LibC::Int) : LibC::Int
  fun write_inquiry_transmit_power_level = hci_write_inquiry_transmit_power_level(dd : LibC::Int, level : LibC::Int, to : LibC::Int) : LibC::Int
  fun read_transmit_power_level = hci_read_transmit_power_level(dd : LibC::Int, handle : LibC::Int, type : LibC::Int, level : LibC::Int*, to : LibC::Int) : LibC::Int
  fun read_link_policy = hci_read_link_policy(dd : LibC::Int, handle : LibC::Int, policy : LibC::Int*, to : LibC::Int) : LibC::Int
  fun write_link_policy = hci_write_link_policy(dd : LibC::Int, handle : LibC::Int, policy : LibC::Int, to : LibC::Int) : LibC::Int
  fun read_link_supervision_timeout = hci_read_link_supervision_timeout(dd : LibC::Int, handle : LibC::Int, timeout : LibC::Int*, to : LibC::Int) : LibC::Int
  fun write_link_supervision_timeout = hci_write_link_supervision_timeout(dd : LibC::Int, handle : LibC::Int, timeout : LibC::Int, to : LibC::Int) : LibC::Int
  fun set_afh_classification = hci_set_afh_classification(dd : LibC::Int, map : LibC::Int*, to : LibC::Int) : LibC::Int
  fun read_link_quality = hci_read_link_quality(dd : LibC::Int, handle : LibC::Int, link_quality : LibC::Int*, to : LibC::Int) : LibC::Int
  fun read_rssi = hci_read_rssi(dd : LibC::Int, handle : LibC::Int, rssi : LibC::Int*, to : LibC::Int) : LibC::Int
  fun read_afh_map = hci_read_afh_map(dd : LibC::Int, handle : LibC::Int, mode : LibC::Int*, map : LibC::Int*, to : LibC::Int) : LibC::Int
  fun read_clock = hci_read_clock(dd : LibC::Int, handle : LibC::Int, which : LibC::Int, clock : LibC::Int*, accuracy : LibC::Int*, to : LibC::Int) : LibC::Int
  fun le_set_scan_enable = hci_le_set_scan_enable(dev_id : LibC::Int, enable : LibC::Int, filter_dup : LibC::Int, to : LibC::Int) : LibC::Int
  fun le_set_scan_parameters = hci_le_set_scan_parameters(dev_id : LibC::Int, type : LibC::Int, interval : LibC::Int, window : LibC::Int, own_type : LibC::Int, filter : LibC::Int, to : LibC::Int) : LibC::Int
  fun le_set_advertise_enable = hci_le_set_advertise_enable(dev_id : LibC::Int, enable : LibC::Int, to : LibC::Int) : LibC::Int
  fun le_create_conn = hci_le_create_conn(dd : LibC::Int, interval : LibC::Int, window : LibC::Int, initiator_filter : LibC::Int, peer_bdaddr_type : LibC::Int, peer_bdaddr : LibC::Int, own_bdaddr_type : LibC::Int, min_interval : LibC::Int, max_interval : LibC::Int, latency : LibC::Int, supervision_timeout : LibC::Int, min_ce_length : LibC::Int, max_ce_length : LibC::Int, handle : LibC::Int*, to : LibC::Int) : LibC::Int
  fun le_conn_update = hci_le_conn_update(dd : LibC::Int, handle : LibC::Int, min_interval : LibC::Int, max_interval : LibC::Int, latency : LibC::Int, supervision_timeout : LibC::Int, to : LibC::Int) : LibC::Int
  fun le_add_white_list = hci_le_add_white_list(dd : LibC::Int, bdaddr : LibC::Int*, type : LibC::Int, to : LibC::Int) : LibC::Int
  fun le_rm_white_list = hci_le_rm_white_list(dd : LibC::Int, bdaddr : LibC::Int*, type : LibC::Int, to : LibC::Int) : LibC::Int
  fun le_read_white_list_size = hci_le_read_white_list_size(dd : LibC::Int, size : LibC::Int*, to : LibC::Int) : LibC::Int
  fun le_clear_white_list = hci_le_clear_white_list(dd : LibC::Int, to : LibC::Int) : LibC::Int
  fun le_add_resolving_list = hci_le_add_resolving_list(dd : LibC::Int, bdaddr : LibC::Int*, type : LibC::Int, peer_irk : LibC::Int*, local_irk : LibC::Int*, to : LibC::Int) : LibC::Int
  fun le_rm_resolving_list = hci_le_rm_resolving_list(dd : LibC::Int, bdaddr : LibC::Int*, type : LibC::Int, to : LibC::Int) : LibC::Int
  fun le_clear_resolving_list = hci_le_clear_resolving_list(dd : LibC::Int, to : LibC::Int) : LibC::Int
  fun le_read_resolving_list_size = hci_le_read_resolving_list_size(dd : LibC::Int, size : LibC::Int*, to : LibC::Int) : LibC::Int
  fun le_set_address_resolution_enable = hci_le_set_address_resolution_enable(dev_id : LibC::Int, enable : LibC::Int, to : LibC::Int) : LibC::Int
  fun le_read_remote_features = hci_le_read_remote_features(dd : LibC::Int, handle : LibC::Int, features : LibC::Int*, to : LibC::Int) : LibC::Int
  fun for_each_dev = hci_for_each_dev(flag : LibC::Int, func : (LibC::Int, LibC::Int, LibC::Long -> LibC::Int), arg : LibC::Long) : LibC::Int
  fun get_route = hci_get_route(bdaddr : LibC::Int*) : LibC::Int
  fun bustostr = hci_bustostr(bus : LibC::Int) : LibC::Char*
  fun typetostr = hci_typetostr(type : LibC::Int) : LibC::Char*
  fun dtypetostr = hci_dtypetostr(type : LibC::Int) : LibC::Char*
  fun dflagstostr = hci_dflagstostr(flags : LibC::Int) : LibC::Char*
  fun ptypetostr = hci_ptypetostr(ptype : LibC::UInt) : LibC::Char*
  fun strtoptype = hci_strtoptype(str : LibC::Char*, val : LibC::UInt*) : LibC::Int
  fun scoptypetostr = hci_scoptypetostr(ptype : LibC::UInt) : LibC::Char*
  fun strtoscoptype = hci_strtoscoptype(str : LibC::Char*, val : LibC::UInt*) : LibC::Int
  fun lptostr = hci_lptostr(ptype : LibC::UInt) : LibC::Char*
  fun strtolp = hci_strtolp(str : LibC::Char*, val : LibC::UInt*) : LibC::Int
  fun lmtostr = hci_lmtostr(ptype : LibC::UInt) : LibC::Char*
  fun strtolm = hci_strtolm(str : LibC::Char*, val : LibC::UInt*) : LibC::Int
  fun cmdtostr = hci_cmdtostr(cmd : LibC::UInt) : LibC::Char*
  fun commandstostr = hci_commandstostr(commands : LibC::Int*, pref : LibC::Char*, width : LibC::Int) : LibC::Char*
  fun vertostr = hci_vertostr(ver : LibC::UInt) : LibC::Char*
  fun strtover = hci_strtover(str : LibC::Char*, ver : LibC::UInt*) : LibC::Int
  fun set_bit = hci_set_bit(nr : LibC::Int, addr : Void*)
  fun clear_bit = hci_clear_bit(nr : LibC::Int, addr : Void*)
  fun test_bit = hci_test_bit(nr : LibC::Int, addr : Void*) : LibC::Int
  fun filter_clear = hci_filter_clear(f : Void*)
  fun filter_set_ptype = hci_filter_set_ptype(t : LibC::Int, f : Void*)
  fun filter_clear_ptype = hci_filter_clear_ptype(t : LibC::Int, f : Void*)
  fun filter_test_ptype = hci_filter_test_ptype(t : LibC::Int, f : Void*) : LibC::Int
  fun filter_all_ptypes = hci_filter_all_ptypes(f : Void*)
  fun filter_set_event = hci_filter_set_event(e : LibC::Int, f : Void*)
  fun filter_clear_event = hci_filter_clear_event(e : LibC::Int, f : Void*)
  fun filter_test_event = hci_filter_test_event(e : LibC::Int, f : Void*) : LibC::Int
  fun filter_all_events = hci_filter_all_events(f : Void*)
  fun filter_set_opcode = hci_filter_set_opcode(opcode : LibC::Int, f : Void*)
  fun filter_clear_opcode = hci_filter_clear_opcode(f : Void*)
  fun filter_test_opcode = hci_filter_test_opcode(opcode : LibC::Int, f : Void*) : LibC::Int

  fun get_le64 = bt_get_le64(ptr : Void*) : Uint64T
  fun get_be64 = bt_get_be64(ptr : Void*) : Uint64T
  fun get_le32 = bt_get_le32(ptr : Void*) : Uint32T
  fun get_be32 = bt_get_be32(ptr : Void*) : Uint32T
  fun get_le16 = bt_get_le16(ptr : Void*) : Uint16T
  fun get_be16 = bt_get_be16(ptr : Void*) : Uint16T
  fun put_le64 = bt_put_le64(val : Uint64T, ptr : Void*)
  fun put_be64 = bt_put_be64(val : Uint64T, ptr : Void*)
  fun put_le32 = bt_put_le32(val : Uint32T, ptr : Void*)
  fun put_be32 = bt_put_be32(val : Uint32T, ptr : Void*)
  fun put_le16 = bt_put_le16(val : Uint16T, ptr : Void*)
  fun put_be16 = bt_put_be16(val : Uint16T, ptr : Void*)
  fun malloc = bt_malloc(size : LibC::Int) : Void*
  fun free = bt_free(ptr : Void*)
  fun error = bt_error(code : Uint16T) : LibC::Int
  fun compidtostr = compidtostr(id : LibC::Int) : LibC::Char*
  fun batostr = batostr(ba : BdaddrT*) : LibC::Char*
  fun ba2str = ba2str(ba : BdaddrT*, str : LibC::Char*) : LibC::Int
  fun str2ba = str2ba(str : LibC::Char*, ba : BdaddrT*) : LibC::Int
  fun ba2oui = ba2oui(ba : BdaddrT*, oui : LibC::Char*) : LibC::Int
  fun bachk = bachk(str : LibC::Char*) : LibC::Int
  fun baprintf = baprintf(format : LibC::Char*, ...) : LibC::Int
  # fun bafprintf = bafprintf(stream : File*, format : LibC::Char*, ...) : LibC::Int
end
