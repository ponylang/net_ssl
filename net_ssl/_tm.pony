use @timegm[I64](tm: Tm)

struct Tm
  """
  Pony mapping of the C struct tm
  """
  var tm_sec: I32 = I32(0) // FundamentalType
  var tm_min: I32 = I32(0) // FundamentalType
  var tm_hour: I32 = I32(0) // FundamentalType
  var tm_mday: I32 = I32(0) // FundamentalType
  var tm_mon: I32 = I32(0) // FundamentalType
  var tm_year: I32 = I32(0) // FundamentalType
  var tm_wday: I32 = I32(0) // FundamentalType
  var tm_yday: I32 = I32(0) // FundamentalType
  var tm_isdst: I32 = I32(0) // FundamentalType
  var tm_gmtoff: I64 = I64(0) // FundamentalType
  var tm_zone: Pointer[U8] = Pointer[U8] // PointerType

  fun ref timegm(): I64 =>
    """
    Mapping to the C function call which takes a Tm struct and returns
    UTC UNIX epoch time.
    """
    @timegm(this)

