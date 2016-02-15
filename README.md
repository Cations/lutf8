# Lua UTF-8
[Lua 5.3][1] came with a nice UTF-8 support library internally boundled.
This is that same library packaged as a standalone library, which can be used by any version of Lua (5.1, 5.2 and LuaJIT).

## Installing `lutf8`
On Unix systems or using a Make-like interface simply run
```
sudo make
sudo make install
```
For more information on how to customize the building procedure, check both makefiles (at [root][2] and [src][3])

You can also grab a [rock][4]!
```
luarocks install lutf8
```
## Usage
```lua
local utf8 = require "utf8"
```
Check the [Lua Manual][5] for information

## License
[MIT License - Copyright (C) 1994-2015 Lua.org, PUC-Rio, 2015 LOVE Development Team.][6]

[1]:http://www.lua.org/download.html
[2]:https://github.com/Positive07/lutf8/blob/master/makefile
[3]:https://github.com/Positive07/lutf8/blob/master/src/makefile
[4]:https://luarocks.org/modules/positive07/lutf8
[5]:http://www.lua.org/manual/5.3/manual.html#6.5
[6]:https://github.com/Positive07/lutf8/blob/master/LICENSE
