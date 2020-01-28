BIN = ./node_modules/.bin
PKG = lib node_modules

test: $(PKG)
	@npm test
test-debug: $(PKG)
	@node --inspect-brk node_modules/.bin/jest --runInBand

docs: $(PKG)
	@npm run storybook
docs-build: $(PKG)
	@npm run build-storybook
docs-publish: $(PKG)
	@npm run deploy-storybook

publish: lib clean node_modules
	@npm publish --access public

node_modules: package.json
	@npm install

clean:
	@rm -rf build lib-dist node_modules

.PHONY: clean publish test test-ci test-debug docs docs-build docs-deploy
