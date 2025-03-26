config ?= release

PACKAGE := net_ssl
GET_DEPENDENCIES_WITH := corral fetch
CLEAN_DEPENDENCIES_WITH := corral clean
COMPILE_WITH := corral run -- ponyc

LINK_STATIC ?= false
STATIC_DEPS =
LIBRESSL_VERSION := 3.9.2
LIBRESSL_DOWNLOAD_URL := "https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-$(LIBRESSL_VERSION).tar.gz"

BUILD_DIR ?= build/$(config)
SRC_DIR ?= $(PACKAGE)
tests_binary := $(BUILD_DIR)/$(PACKAGE)
docs_dir := build/$(PACKAGE)-docs

ifdef config
	ifeq (,$(filter $(config),debug release))
		$(error Unknown configuration "$(config)")
	endif
endif

ifeq ($(config),release)
	PONYC = ${COMPILE_WITH}
else
	PONYC = ${COMPILE_WITH} --debug
endif

ifeq ($(LINK_STATIC),true)
	SSL = -Dopenssl_0.9.0 -Dlink_static
	STATIC_DEPS = libssl.a libcrypto.a
else
  ifeq (,$(filter $(MAKECMDGOALS),clean docs realclean TAGS))
    ifeq ($(ssl), 3.0.x)
			SSL = -Dopenssl_3.0.x
    else ifeq ($(ssl), 1.1.x)
			SSL = -Dopenssl_1.1.x
    else ifeq ($(ssl), 0.9.0)
			SSL = -Dopenssl_0.9.0
    else
      $(error Unknown SSL version "$(ssl)". Must set using 'ssl=FOO')
    endif
  endif
endif

SOURCE_FILES := $(shell find $(SRC_DIR) -name \*.pony)

all: $(STATIC_DEPS) test

test: unit-tests build-examples

unit-tests: $(tests_binary)
	$^ --exclude=integration --sequential

$(tests_binary): $(STATIC_DEPS) $(GEN_FILES) $(SOURCE_FILES) | $(BUILD_DIR)
	${GET_DEPENDENCIES_WITH}
	${PONYC} ${SSL} -o ${BUILD_DIR} $(SRC_DIR)

build-examples: $(STATIC_DEPS)
	${GET_DEPENDENCIES_WITH}
	find examples/*/* -name '*.pony' -print | xargs -n 1 dirname  | sort -u | grep -v ffi- | xargs -n 1 -I {} ${PONYC} ${SSL} -s --checktree -o ${BUILD_DIR} {}

clean:
	corral clean
	rm -rf $(BUILD_DIR)
	rm -rf $(STATIC_DEPS)

$(docs_dir): $(GEN_FILES) $(SOURCE_FILES)
	rm -rf $(docs_dir)
	${GET_DEPENDENCIES_WITH}
	${PONYC} --docs-public --pass=docs --output build $(SRC_DIR)

docs: $(docs_dir)

TAGS:
	ctags --recurse=yes $(SRC_DIR)

lib: $(STATIC_DEPS)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

libressl-$(LIBRESSL_VERSION)/crypto/.libs/libcrypto.a: libressl-$(LIBRESSL_VERSION)
	cd libressl-$(LIBRESSL_VERSION) && ./configure
	$(MAKE) -C libressl-$(LIBRESSL_VERSION)

libcrypto.a: libressl-$(LIBRESSL_VERSION)/crypto/.libs/libcrypto.a
	cp libressl-$(LIBRESSL_VERSION)/crypto/.libs/libcrypto.a libcrypto.a

libressl-$(LIBRESSL_VERSION)/ssl/.libs/libssl.a: libressl-$(LIBRESSL_VERSION)
	cd libressl-$(LIBRESSL_VERSION) && ./configure
	$(MAKE) -C libressl-$(LIBRESSL_VERSION)

libssl.a: libressl-$(LIBRESSL_VERSION)/ssl/.libs/libssl.a
	cp libressl-$(LIBRESSL_VERSION)/ssl/.libs/libssl.a libssl.a

libressl-$(LIBRESSL_VERSION):
	curl -s $(LIBRESSL_DOWNLOAD_URL) | tar xz

.PHONY: all clean TAGS test
