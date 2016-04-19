package = "lutf8"

version = "scm-0"

source = {
   url = "https://github.com/Cations/lutf8/archive/master.zip",
   dir = "lutf8-master",
}

description = {
   summary = "Lua 5.3 standard library for UTF-8 manipulation",
   detailed = [[
      Lua 5.3 came with a nice UTF-8 support library internally boundled.
      This is that same library packaged as a standalone library, which can be used
      by any version of Lua (5.1, 5.2 and LuaJIT).

      Copyright (C) 1994-2015 Lua.org, PUC-Rio, 2015 LOVE Development Team.
   ]],
   homepage = "https://www.github.com/Cations/lutf8/",
   license = "MIT"
}

dependencies = {
   "lua >= 5.1"
}

local function make_plat(plat)
	local defines = {
	  unix = {
		 "LUAUTF_DEBUG",
		 "LUAUTF_API=__attribute__((visibility(\"default\")))"
	  },
	  macosx = {
		 "LUAUTF_DEBUG",
		 "UNIX_HAS_SUN_LEN",
		 "LUAUTF_API=__attribute__((visibility(\"default\")))"
	  },
	  win32 = {
		 "LUAUTF_DEBUG",
		 "NDEBUG",
		 "LUAUTF_API=__declspec(dllexport)"
	  },
	  mingw32 = {
		 "LUAUTF_DEBUG",
		 "LUAUTF_INET_PTON",
		 "WINVER=0x0501",
		 "LUAUTF_API=__declspec(dllexport)"
	  }
	}

	local modules = {
		["utf8"] = {
			sources = { "src/lutf8lib.c", "src/compat.c" },
			defines = defines[plat],
			incdir = "/src"
		},
	}

	return { modules = modules }
end

build = {
   type = "builtin",
   platforms = {
     unix = make_plat("unix"),
     macosx = make_plat("macosx"),
     win32 = make_plat("win32"),
     mingw32 = make_plat("mingw32")
   },
}
