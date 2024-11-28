use @X509_NAME_get_text_by_NID[I32](x509name: Pointer[_X509Name] tag, nid: I32, buf: Pointer[U8] tag, len: I32)

primitive _X509Name
  """
  Functions to convert X509Name to Strings for display
  (Will likely become a class in the future to support generating them
  """
  fun string(x509name: Pointer[_X509Name] tag): String val ? =>
    """
    Converts X509Names into String val
    """
    if (x509name.is_null()) then error end
    let len: I32 = @X509_NAME_get_text_by_NID(x509name, I32(13), Pointer[U8], I32(0))
    if (len == -1) then error end
    let str: String ref = recover String(len.usize()) end
    @X509_NAME_get_text_by_NID(x509name, I32(13), str.cstring(), len+1)
    str.recalc()
    if (str.size() != len.usize()) then error end
    str.clone()

