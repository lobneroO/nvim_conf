-- it would be nice to automatically load all .lua files in this directory.
-- until that works, manually add every file (e.g. if the file is cpp.lua, then require
--  dap for the folder
--  cpp for the file name
--  and omit the .lua extension

-- first setup lldb, as that is shared among different languages
require("debug-adapters.lldb_setup")

-- then setup the adapters using lldb
require("debug-adapters.cpp")
require("debug-adapters.rs")
