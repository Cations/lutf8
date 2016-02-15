# lutf8 makefile
#
# see src/makefile for description of how to customize the build
#
# Targets:
#   install            install system independent support
#   install-both       install for lua51 lua52 lua53
#   print	           print the build settings

PLAT?= linux
PLATS= macosx linux win32 mingw freebsd solaris

all: $(PLAT)

$(PLATS) none install local clean:
	$(MAKE) -C src $@

print:
	$(MAKE) -C src $@

install-both:
	$(MAKE) clean
	@cd src; $(MAKE) $(PLAT) LUAV=5.1
	@cd src; $(MAKE) install LUAV=5.1
	$(MAKE) clean
	@cd src; $(MAKE) $(PLAT) LUAV=5.2
	@cd src; $(MAKE) install LUAV=5.2
	$(MAKE) clean
	@cd src; $(MAKE) $(PLAT) LUAV=5.3
	@cd src; $(MAKE) install LUAV=5.3

.PHONY: test
