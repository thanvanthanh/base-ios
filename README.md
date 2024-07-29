
## Base-ios

Welcome to Base-ios which is doing whatever!

## Getting started

First, you will need a few tools to start working on Base-ios:

##  `Xcode`: From the app store or wherever

## Ruby install
  <img src="https://www.ruby-lang.org/images/header-ruby-logo.png">
  
- Check ruby version:
  ```
  rbenv install -l
  ```
- Install latest ruby:
  ```
  rbenv install 3.3.4 && rbenv rehash
  ```
- As needed, set ruby version using global, local, shell options:
  ```
  rbenv global 3.3.4
  ```
## [Bundler](http://bundler.io):
  <img src="http://bundler.io/images/header_transparent_bg.png" width=100>

```
 gem install bundler
  ```
 ## [Mint](https://github.com/yonaskolb/mint) 🌱:
  ```
  brew install mint
  ```

## => Then run `make` to have a valid project ready to be used.
<img src="https://developer.apple.com/assets/elements/icons/xcode-12/xcode-12-96x96_2x.png" width=100>

```
make
```

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
