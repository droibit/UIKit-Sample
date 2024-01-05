.PHONY: bootstrap
bootstrap:
	mint bootstrap
	cp -pR .githooks/* .git/hooks

.PHONY: generate-project
generate-project:
	mint run xcodegen xcodegen generate --project ./App

.PHONY: format
format:
	./scripts/swiftformat.sh

.PHONY: lint
lint:
	./scripts/swiftlint.sh

.PHONY: gen-mocks
gen-mocks:
	./gen-mocks.sh