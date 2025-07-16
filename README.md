# net_ssl

Pony library that brings SSL networking support to Pony. Requires LibreSSL or OpenSSL. See installation for more details.

## Status

Deprecated. Use [ponylang/ssl](https://github.com/ponylang/ssl) instead.

To update from `net_ssl` to `ssl`, should update your dependency in corral.json to the most recent ponylang/ssl version. As of version 1.0.0, the API is compatible with `net_ssl` but there is a small breaking change. Where you previously had `use "net_ssl"` you will now need to do `use "ssl/net"`.
