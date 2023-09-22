
## Base-ios

Welcome to Base-ios which is doing whatever!

## Getting started

First, you will need a few tools to start working on Base-ios:

- `Xcode`: From the app store or wherever
- [Bundler](http://bundler.io): `gem install bundler`
- [Mint](https://github.com/yonaskolb/mint): `brew install mint`

Then run `make` to have a valid project ready to be used.

### Makefile

- `make all`: configure the project as a new one (mainly used for the CI)
- `make install`:
  - install gem dependencies
  - Isntall Bundle
- `make generate`: generate a new new xcodeproj
- `make swiftgen`: reload swiftgen assets, ib, localizables, ...

## Documentation

- [Scripts](Documentations/Scripts.md)
- [Fastlane's README](fastlane/README.md)
