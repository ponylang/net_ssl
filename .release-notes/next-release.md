## OpenSSL 3.0.x support added

We've updated net_ssl to work with SSL libraries that support the OpenSSL 3.0.x API.

To compile a program targeting the 3.0.x API:

```bash
corral run -- ponyc -Dopenssl_3.0.x
```

