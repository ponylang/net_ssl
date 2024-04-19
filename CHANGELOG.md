# Change Log

All notable changes to this library will be documented in this file. This project adheres to [Semantic Versioning](http://semver.org/) and [Keep a CHANGELOG](http://keepachangelog.com/).

## [1.3.3] - 2024-04-19

### Changed

- - Update to LibreSSL 3.9.1 on Windows ([PR #111](https://github.com/ponylang/net_ssl/pull/111))

## [1.3.2] - 2024-01-14

### Fixed

- Fix bug triggered by OpenSSL 3.2.0 ([PR #107](https://github.com/ponylang/net_ssl/pull/107))

## [1.3.1] - 2023-04-27

### Changed

- Change location we download LibreSSL from for Windows users ([PR #85](https://github.com/ponylang/net_ssl/pull/85))

## [1.3.0] - 2023-01-03

### Added

- Add support for OpenSSL 3.0.x ([PR #81](https://github.com/ponylang/net_ssl/pull/81))

## [1.2.1] - 2022-02-26

### Fixed

- Update to work with object capabilities changes in Pony 0.49.0 ([PR #69](https://github.com/ponylang/net_ssl/pull/69))
- Update to address PonyTest package being renamed ([PR #70](https://github.com/ponylang/net_ssl/pull/70))
- Remove hardcoding of Visual Studio version ([PR #71](https://github.com/ponylang/net_ssl/pull/71))

## [1.2.0] - 2022-02-10

### Added

- Support for using ponyup on Windows ([PR #66](https://github.com/ponylang/net_ssl/pull/66))

## [1.1.8] - 2022-01-16

### Changed

- Update to reflect change in type of Env.root ([PR #64](https://github.com/ponylang/net_ssl/pull/64))

## [1.1.7] - 2021-11-01

### Added

- Add path to Homebrew's LibreSSL on ARM macOS ([PR #54](https://github.com/ponylang/net_ssl/pull/54))

## [1.1.6] - 2021-09-03

### Fixed

- Update to compile with ponyc 0.44.0 ([PR #49](https://github.com/ponylang/net_ssl/pull/49))

## [1.1.5] - 2021-04-10

### Changed

- Remove explicit return type from FFI calls ([PR #48](https://github.com/ponylang/net_ssl/pull/48))

## [1.1.4] - 2021-03-29

### Changed

- Declare all FFI functions ([PR #47](https://github.com/ponylang/net_ssl/pull/47))

## [1.1.3] - 2021-03-29

### Fixed

- Fix possible memory leak ([PR #46](https://github.com/ponylang/net_ssl/pull/46))

## [1.1.2] - 2021-02-07

## [1.1.1] - 2020-09-01

### Added

- Add the ability to load Windows root certificates ([PR #38](https://github.com/ponylang/net_ssl/pull/38))

## [1.1.0] - 2020-08-22

### Added

- Build Windows libs upon fetch. ([PR #36](https://github.com/ponylang/net_ssl/pull/36))

## [1.0.1] - 2020-08-11

### Added

- Make Windows installation easier ([PR #33](https://github.com/ponylang/net_ssl/pull/33))

## [1.0.0] - 2019-09-02

### Added

- Initial version

