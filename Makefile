ifneq ($(wildcard IHP/.*),)
IHP = IHP/lib/IHP
else
ifneq ($(wildcard build/ihp-lib),)
IHP = build/ihp-lib
else
ifneq ($(shell which RunDevServer),)
IHP = $(shell dirname $$(which RunDevServer))/../lib/IHP
else
IHP = $(error IHP not found! Run the following command to fix this:    nix-shell --run 'make .envrc'    )
endif
endif
endif

CSS_FILES += ${IHP}/static/vendor/bootstrap.min.css
CSS_FILES += ${IHP}/static/vendor/flatpickr.min.css
CSS_FILES += static/app.css

JS_FILES += ${IHP}/static/vendor/jquery-3.6.0.slim.min.js
JS_FILES += ${IHP}/static/vendor/timeago.js
JS_FILES += ${IHP}/static/vendor/popper.min.js
JS_FILES += ${IHP}/static/vendor/bootstrap.min.js
JS_FILES += ${IHP}/static/vendor/flatpickr.js
JS_FILES += ${IHP}/static/helpers.js
JS_FILES += ${IHP}/static/vendor/morphdom-umd.min.js
JS_FILES += ${IHP}/static/vendor/turbolinks.js
JS_FILES += ${IHP}/static/vendor/turbolinksInstantClick.js
JS_FILES += ${IHP}/static/vendor/turbolinksMorphdom.js
JS_FILES += static/app.js

include ${IHP}/Makefile.dist

Frontend/node_modules:
	cd Frontend && npm install

static/app.js: Frontend/node_modules Frontend/app.ts
	cd Frontend && ./node_modules/.bin/esbuild app.ts --bundle --outfile=../static/app.js ${ESBUILD_FLAGS}

watch-frontend:
	touch Frontend/app.ts # Force rebuild
	$(MAKE) static/app.js ESBUILD_FLAGS="--watch"
