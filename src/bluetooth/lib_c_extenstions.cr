lib LibC
  BTPROTO_RFCOMM =      3
  AF_BLUETOOTH   = 31_u16

  # alias SocklenT = UInt
  # alias SaFamilyT = UShort

  # struct Sockaddr
  #   sa_family : SaFamilyT
  #   sa_data : StaticArray(Char, 14)
  # end
  fun memset = memset(pointer : Void*, int : Int32, size : Int32)
  fun ioctl = ioctl(fd : Int32, request : UInt32, arg : UInt64) : Int32

  struct SockaddrBT
    sa_family : SaFamilyT
    sa_data : StaticArray(Char, 10)
    size : Int32
  end
end
