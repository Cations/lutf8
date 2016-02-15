# lutf8 src/makefile
#
# Definitions in this section can be overriden on the command line or in the
# environment.
#
# These are equivalent:
#
#    export PLAT=linux DEBUG=DEBUG LUAV=5.2 prefix=/sw
#    make
#
# and
#
#   make PLAT=linux DEBUG=DEBUG LUAV=5.2 prefix=/sw

# PLAT: linux macosx win32 mingw
# platform to build for
PLAT?=linux

# LUAV: 5.1 5.2
# lua version to build against
LUAV?=5.1

# MYCFLAGS: to be set by user if needed
MYCFLAGS=

# MYLDFLAGS: to be set by user if needed
MYLDFLAGS=

# DEBUG: NODEBUG DEBUG
# debug mode causes lutf8 to collect and returns timing information useful
# for testing and debugging lutf8 itself
DEBUG?=NODEBUG

# where lua headers are found for macosx builds
# LUAINC_macosx:
# /opt/local/include
LUAINC_macosx_base?=/opt/local/include
LUAINC_macosx?=$(LUAINC_macosx_base)/lua/$(LUAV)
# FIXME default should this default to fink or to macports?
# What happens when more than one Lua version is installed?
LUAPREFIX_macosx?=/opt/local
CDIR_macosx?=lib/lua/$(LUAV)

# LUAINC_linux:
# /usr/include/lua$(LUAV)
# /usr/local/include
# /usr/local/include/lua$(LUAV)
# where lua headers are found for linux builds
LUAINC_linux_base?=/usr/include
LUAINC_linux?=$(LUAINC_linux_base)/lua/$(LUAV)
LUAPREFIX_linux?=/usr/local
CDIR_linux?=lib/lua/$(LUAV)

# LUAINC_freebsd:
# /usr/local/include/lua$(LUAV)
# where lua headers are found for freebsd builds
LUAINC_freebsd_base?=/usr/local/include/
LUAINC_freebsd?=$(LUAINC_freebsd_base)/lua$(LUAV)
LUAPREFIX_freebsd?=/usr/local/
CDIR_freebsd?=lib/lua/$(LUAV)

# where lua headers are found for mingw builds
# LUAINC_mingw:
# /opt/local/include
LUAINC_mingw_base?=/usr/include
LUAINC_mingw?=$(LUAINC_mingw_base)/lua/$(LUAV)
LUALIB_mingw_base?=/usr/bin
LUALIB_mingw?=$(LUALIB_mingw_base)/lua/$(LUAV)/lua$(subst .,,$(LUAV)).dll
LUAPREFIX_mingw?=/usr
CDIR_mingw?=lua/$(LUAV)
LDIR_mingw?=lua/$(LUAV)/lua


# LUAINC_win32:
# LUALIB_win32:
# where lua headers and libraries are found for win32 builds
LUAPREFIX_win32?=
LUAINC_win32?=$(LUAPREFIX_win32)/include/lua/$(LUAV)
PLATFORM_win32?=Release
CDIR_win32?=bin/lua/$(LUAV)/$(PLATFORM_win32)
LUALIB_win32?=$(LUAPREFIX_win32)/lib/lua/$(LUAV)/$(PLATFORM_win32)
LUALIBNAME_win32?=lua$(subst .,,$(LUAV)).lib


# LUAINC_solaris:
LUAINC_solaris_base?=/usr/include
LUAINC_solaris?=$(LUAINC_solaris_base)/lua/$(LUAV)
LUAPREFIX_solaris?=/usr/local
CDIR_solaris?=lib/lua/$(LUAV)

# prefix: /usr/local /usr /opt/local /sw
# the top of the default install tree
prefix?=$(LUAPREFIX_$(PLAT))

CDIR?=$(CDIR_$(PLAT))

# DESTDIR: (no default)
# used by package managers to install into a temporary destination
DESTDIR=

#------
# Definitions below can be overridden on the make command line, but
# shouldn't have to be.


#------
# Install directories
#

INSTALL_DIR=install -d
INSTALL_DATA=install -m644
INSTALL_EXEC=install
INSTALL_TOP=$(DESTDIR)$(prefix)

INSTALL_TOP_CDIR=$(INSTALL_TOP)/$(CDIR)

INSTALL_UTF_CDIR=$(INSTALL_TOP_CDIR)

print:
	@echo PLAT=$(PLAT)
	@echo LUAV=$(LUAV)
	@echo DEBUG=$(DEBUG)
	@echo prefix=$(prefix)
	@echo LUAINC_$(PLAT)=$(LUAINC_$(PLAT))
	@echo LUALIB_$(PLAT)=$(LUALIB_$(PLAT))
	@echo INSTALL_TOP_CDIR=$(INSTALL_TOP_CDIR)

#------
# Supported platforms
#
PLATS= macosx linux win32 mingw solaris

#------
# Compiler and linker settings
# for Mac OS X
SO_macosx=so
O_macosx=o
CC_macosx=gcc
DEF_macosx= -DLUAUTF_$(DEBUG) -DUNIX_HAS_SUN_LEN \
	-DLUAUTF_API='__attribute__((visibility("default")))' \
	-DUNIX_API='__attribute__((visibility("default")))'
CFLAGS_macosx= -I$(LUAINC) $(DEF) -Wall -O2 -fno-common \
	-fvisibility=hidden
LDFLAGS_macosx= -bundle -undefined dynamic_lookup -o
LD_macosx= export MACOSX_DEPLOYMENT_TARGET="10.3"; gcc

#------
# Compiler and linker settings
# for Linux
SO_linux=so
O_linux=o
CC_linux=gcc
DEF_linux=-DLUAUTF_$(DEBUG) \
	-DLUAUTF_API='__attribute__((visibility("default")))' \
	-DUNIX_API='__attribute__((visibility("default")))'
CFLAGS_linux= -I$(LUAINC) $(DEF) -Wall -Wshadow -Wextra \
	-Wimplicit -O2 -ggdb3 -fpic -fvisibility=hidden
LDFLAGS_linux=-O -shared -fpic -o
LD_linux=gcc

#------
# Compiler and linker settings
# for FreeBSD
SO_freebsd=so
O_freebsd=o
CC_freebsd=gcc
DEF_freebsd=-DLUAUTF_$(DEBUG) \
	-DLUAUTF_API='__attribute__((visibility("default")))' \
	-DUNIX_API='__attribute__((visibility("default")))'
CFLAGS_freebsd= -I$(LUAINC) $(DEF) -Wall -Wshadow -Wextra \
	-Wimplicit -O2 -ggdb3 -fpic -fvisibility=hidden
LDFLAGS_freebsd=-O -shared -fpic -o
LD_freebsd=gcc

#------
# Compiler and linker settings
# for Solaris
SO_solaris=so
O_solaris=o
CC_solaris=gcc
DEF_solaris=-DLUAUTF_$(DEBUG) \
	-DLUAUTF_API='__attribute__((visibility("default")))' \
	-DUNIX_API='__attribute__((visibility("default")))' \
CFLAGS_solaris=-I$(LUAINC) $(DEF) -Wall -Wshadow -Wextra \
	-Wimplicit -O2 -ggdb3 -fpic -fvisibility=hidden
LDFLAGS_solaris=-lnsl -lutf8 -lresolv -O -shared -fpic -o
LD_solaris=gcc

#------
# Compiler and linker settings
# for MingW
SO_mingw=dll
O_mingw=o
CC_mingw=gcc
DEF_mingw= -DLUAUTF_INET_PTON -DLUAUTF_$(DEBUG) \
	-DWINVER=0x0501 -DLUAUTF_API='__declspec(dllexport)'
CFLAGS_mingw= -I$(LUAINC) $(DEF) -Wall -O2 -fno-common \
	-fvisibility=hidden
LDFLAGS_mingw= $(LUALIB) -shared -Wl,-s -lws2_32 -o
LD_mingw=gcc

#------
# Compiler and linker settings
# for Win32
SO_win32=dll
O_win32=obj
CC_win32=cl
DEF_win32= //D "WIN32" //D "NDEBUG" //D "_WINDOWS" //D "_USRDLL" \
     //D "LUAUTF_API=__declspec(dllexport)" //D "_CRT_SECURE_NO_WARNINGS" \
     //D "_WINDLL" //D "LUAUTF_$(DEBUG)"
CFLAGS_win32=//I "$(LUAINC)" $(DEF) //O2 //Ot //MD //W3 //nologo
LDFLAGS_win32= //nologo //link //NOLOGO //DLL //INCREMENTAL:NO \
    //MANIFEST //MANIFESTFILE:"intermediate.manifest" \
    //MANIFESTUAC:"level='asInvoker' uiAccess='false'" \
	//SUBSYSTEM:WINDOWS //OPT:REF //OPT:ICF //DYNAMICBASE:NO \
    //MACHINE:X86 /LIBPATH:"$(shell cmd //c echo $(LUALIB))" \
	$(LUALIBNAME_win32) ws2_32.lib //OUT:
LD_win32=cl

.SUFFIXES: .obj

.c.obj:
	$(CC) $(CFLAGS) //Fo"$@" //c $<

#------
# Output file names
#
SO=$(SO_$(PLAT))
O=$(O_$(PLAT))
UTF_V=1.13
UTF_SO=utf8-$(UTF_V).$(SO)
UTF=lutf8.$(O)

#------
# Settings selected for platform
#
CC=$(CC_$(PLAT))
DEF=$(DEF_$(PLAT))
CFLAGS=$(MYCFLAGS) $(CFLAGS_$(PLAT))
LDFLAGS=$(MYLDFLAGS) $(LDFLAGS_$(PLAT))
LD=$(LD_$(PLAT))
LUAINC= $(LUAINC_$(PLAT))
LUALIB= $(LUALIB_$(PLAT))

#------
# Modules belonging to UTF8-core
#
UTF_OBJS= \
	compat.$(O) \
	lutf8lib.$(O) \


#------
# Targets
#
default: $(PLAT)


freebsd:
	$(MAKE) all PLAT=freebsd

macosx:
	$(MAKE) all PLAT=macosx

win32:
	$(MAKE) all PLAT=win32

linux:
	$(MAKE) all PLAT=linux

mingw:
	$(MAKE) all PLAT=mingw

solaris:
	$(MAKE) all PLAT=solaris

none:
	@echo "Please run"
	@echo "   make PLATFORM"
	@echo "where PLATFORM is one of these:"
	@echo "   $(PLATS)"

all: $(UTF_SO)

$(UTF_SO): $(UTF_OBJS)
	$(LD) $(UTF_OBJS) $(LDFLAGS)$@

install:
	$(INSTALL_DIR) $(INSTALL_UTF_CDIR)
	$(INSTALL_EXEC) $(UTF_SO) $(INSTALL_UTF_CDIR)/utf8.$(SO)

local:
	$(MAKE) install INSTALL_TOP_CDIR=..

clean:
	rm -f $(UTF_SO) $(UTF_OBJS)

.PHONY: all $(PLATS) default clean echo none

#------
# List of dependencies
#
compat.$(O): compat.c compat.h
lutf8lib.$(O): lprefix.h lutf8lib.h lutf8lib.c
