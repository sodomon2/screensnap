LUASTATIC ?= luastatic
LUA ?= lua5.1
LUA_INCLUDE ?= /usr/include/$(LUA)

PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin

SRC = screensnap.lua

screensnap:
	$(LUASTATIC) $(SRC) -l$(LUA) -I$(LUA_INCLUDE)
	@strip screensnap

install:
	install -Dm775 screensnap $(DESTDIR)$(BINDIR)/screensnap

uninstall:
	rm -rf $(DESTDIR)$(BINDIR)/screensnap

clean:
	rm -rf screensnap.luastatic.c
	rm -rf screensnap

.PHONY: screensnap
