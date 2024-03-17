-- it would be nice to automatically load all .lua files in this directory.
-- until that works, manually add every file (e.g. if the file is cpp.lua, then require
--  dap for the folder
--  cpp for the file name
--  and omit the .lua extension

require("debug-adapters.cpp")
require("debug-adapters.rs")
