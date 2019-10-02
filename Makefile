.PHONY: compile run

run: compile
	./.build/release/swift-c-wrappin

compile: cleanup
	swift build -Xcc -march=native --configuration release

cleanup:
	rm -rf ./.build