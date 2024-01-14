## Fix bug when using OpenSSL 3.2

OpenSSL 3.2 introduced a bug in itself or exposed one in NetSSL via a change in behavior. We believe the bug is in OpenSSL, either way, it was a problem.

HTTPS using the [Ponylang HTTP library](https://github.com/ponylang/http) get requests would hang when in release mode and segfault due to infinite recurion when in debug mode. We've introduced a fix and a regression test has been added to `ponylang/http`.

