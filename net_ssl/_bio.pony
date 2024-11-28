use @BIO_new[Pointer[_BIO]](typ: Pointer[U8])
use @BIO_s_mem[Pointer[U8]]()
use @BIO_free[I32](a: Pointer[_BIO] tag)
use @BIO_free_all[None](a: Pointer[_BIO] tag)
use @BIO_write[I32](bio: Pointer[_BIO] tag, buf: Pointer[U8] tag, len: U32)
use @BIO_read[I32](b: Pointer[_BIO] tag, data: Pointer[U8] tag, dlen: U32)
use @BIO_ctrl_pending[USize](bio: Pointer[_BIO] tag)
use @BIO_gets[U32](bio: Pointer[_BIO] tag, buffer: Pointer[U8] tag, size: U32)
use @PEM_write_bio_X509[U32](bio: Pointer[_BIO] tag, cert: Pointer[X509] tag)

primitive _BIO
  """
  BIO is OpenSSL's generic datastructure that allows the rest of the library
  to write "contiguous" binary data without having to worry about memory
  reällocation.

  In this API it is mainly used for reading data in and out

  // Notate why this isn't used in the SSL setup. (double-free)
  """

  fun new_ptr(): Pointer[_BIO] tag =>
    @BIO_new(@BIO_s_mem())

  fun array(bio: Pointer[_BIO] tag): Array[U8] val =>
    """
    Returns the contents of the BIO as an Array[U8] val
    /// use "buffered" 
    """
    recover val
      var tarr: Array[U8] ref = Array[U8]
      let buffer: Array[U8] ref = Array[U8].init(0, 1024) // Look for the 95% percentile
      var len: I32 = 0
      while ((len = @BIO_read(bio, buffer.cpointer(), buffer.size().u32())); len > 0) do
        buffer.copy_to(tarr, 0, tarr.size(), len.usize())
      end
      tarr
    end

  fun write(bio: Pointer[_BIO] tag, data: (Array[U8] val | String val)): Bool =>
    """
    Writes the contents of the provided Array[U8] or String to the
    BIO
    """
    let readdata: I32 = @BIO_write(bio, data.cpointer(), data.size().u32())
    (readdata == data.size().i32())

  fun string(bio: Pointer[_BIO] tag): String val =>
    """
    Returns the contents of the BIO as a String val
    """
    String.from_array(array(bio))


  fun write_pem_x509(bio: Pointer[_BIO] tag, cert: X509Certificate box): U32 =>
    """
    Writes the certificate in pem form into this Bio object
    """
    @PEM_write_bio_X509(bio, cert._ptr())


  fun free(bio: Pointer[_BIO] tag) =>
    @BIO_free_all(bio)


