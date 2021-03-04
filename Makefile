XCODE_PROJ := myapp.xcodeproj

mint-run := mint run

.PHONY: default
default: bootstrap open

.PHONY: bootstrap
bootstrap:
	mint bootstrap
	"$(MAKE)" carthage
	"$(MAKE)" build-xcodeprj

.PHONY: carthage
carthage:
	scripts/carthage.sh bootstrap --platform iOS --no-use-binaries --cache-builds

.PHONY: build-xcodeprj
build-xcodeprj:
	$(mint-run) xcodegen

.PHONY: open
open:
	open $(XCODE_PROJ)
