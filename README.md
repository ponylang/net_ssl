# net-ssl

Pony library that brings SSL networking support to Pony. Requires LibreSSL or OpenSSL. See installation for more details. 

## Status

[![CircleCI](https://circleci.com/gh/ponylang/net-ssl.svg?style=svg)](https://circleci.com/gh/ponylang/net-ssl)

Production ready.

## Installation

* Install [pony-stable](https://github.com/ponylang/pony-stable)
* Update your `bundle.json`

```json
{ 
  "type": "github",
  "repo": "ponylang/net-ssl"
}
```

* `stable fetch` to fetch your dependencies
* `use "net_ssl"` to include this package
* `stable env ponyc` to compile your application

## Supported SSL versions

The 0.9.0 and 1.1.x OpenSSL versions and corresponding compatible LibreSSL library versions are supported.

The default is to use the 0.9.x library APIs. You can change the selected supported library version at compile-time by using Pony's compile time definition functionality.

### Using OpenSSL 0.9.0

```bash
stable env ponyc -Dopenssl_0.9.0
```

### Using OpenSSL 1.1.x

```bash
stable env ponyc -Dopenssl_1.1.x
```

## Dependencies

`net-ssl` requires either LibreSSL or OpenSSL in order to operate. You'll might need to install it within your environment of choice.

### Installing on APT based Linux distributions

```
sudo apt-get install -y libssl-dev
```

### Installing on Alpine Linux

```
apk add --update libressl-dev
```

### Installing on Arch Linux

```
pacman -S openssl

```

### Installing on macOS with Homebrew

```
brew update
brew install libressl
```

#### Installing on macOS with MacPorts

```
sudo port install libressl
```

### Installing on RPM based Linux distributions with dnf

```
sudo dnf install openssl-devel
```

### Installing on RPM based Linux distributions with yum

```
sudo yum install openssl-devel
```

### Installing on RPM based Linux distributions with zypper

```
sudo zypper install libopenssl-devel
```
### Installing on Windows

Download a prebuilt binary from [https://www.libressl.org/](https://www.libressl.org/).
