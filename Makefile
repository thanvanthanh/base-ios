all: brew-install install generate open

brew-install:
	brew install mint libxml2

install:
	mint bootstrap
	bundle install

# generate
generate:
	mint run xcodegen xcodegen generate
	mint run swiftgen
	bundle exec pod install

# open xcode
open:
	xed .
