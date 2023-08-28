use @ASN1_TIME_to_tm[I32](asn1str: Pointer[ASN1String] tag, tm: Tm)
use @ASN1_STRING_get0_data[Pointer[U8] ref](asn1s: Pointer[ASN1String] tag)
use @ASN1_STRING_length[I32](asn1s: Pointer[ASN1String] tag)
use @ASN1_STRING_type[I32](asn1s: Pointer[ASN1String] tag)
use @printf[I32](fmt: Pointer[U8] tag, ...)

primitive ASN1String
  """
  FIXME
  Functions used to do transformations on ASN1Strings.
  (Note - this will almost certainly transition to a class when it comes
  time to wrap this in an API to be able to create these objects)

  NOTE: OpenSSL stores almost ALL data in ASN1Strings and almost all of
  the other ASN1 types are typedef'd to this under the hood (hence the
  time_to_posix function here)
  """
  fun array(asn1str: Pointer[ASN1String] tag): Array[U8] val ? =>
    """
    Returns the underlying data as an Array[U8]
    """
    if (asn1str.is_null()) then error end
    recover val
      let len: I32 = @ASN1_STRING_length(asn1str)
      let osslptr: Pointer[U8] ref = @ASN1_STRING_get0_data(asn1str)

      (Array[U8].from_cpointer(osslptr, len.usize())).clone()
    end

  fun time_to_posix(asn1str: Pointer[ASN1String] tag): I64 =>
    """
    Assuming this is a valid entry for time, will return the unix epoch time.
    FIXME -- add check for this
    """
    let tm: Tm = Tm
    @ASN1_TIME_to_tm(asn1str, tm)
    tm.timegm()
//    let t: I64 = tm.timegm()
//    @printf("%d : %d : %d\n".cstring(), tm.tm_isdst, tm.tm_gmtoff, t)
//    t + tm.tm_gmtoff
