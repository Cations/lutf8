#ifndef LUAUTF8_LUTF8LIB_H
#define LUAUTF8_LUTF8LIB_H
/*=========================================================================*\
* LuaSocket toolkit
* Standard library for UTF-8 manipulation
* Lua.org, PUC-Rio, modified by the LOVE Development Team
* 2014/11/02
\*=========================================================================*/
#ifdef __cplusplus
extern "C" {
#endif

#include "lua.h"

/*-------------------------------------------------------------------------*\
* Current socket library version
\*-------------------------------------------------------------------------*/
#define LUAUTF8_VERSION    "Lua UTF8 1.13"
#define LUAUTF8_COPYRIGHT  "Copyright (C) 1994-2015 Lua.org, PUC-Rio, 2015 LOVE Development Team"

/*-------------------------------------------------------------------------*\
* This macro prefixes all exported API functions
\*-------------------------------------------------------------------------*/
#ifndef LUAUTF_API
#define LUAUTF_API extern
#endif

/*-------------------------------------------------------------------------*\
* Initializes the library.
\*-------------------------------------------------------------------------*/
#ifdef LOVE_ENABLE_LUAUTF8
	LUALIB_API int luaopen_luautf8(lua_State *L);
#else
	LUAUTF_API int luaopen_utf8(lua_State *L);
#endif

#ifdef __cplusplus
}
#endif

#endif /* LUAUTF8_LUTF8LIB_H */
