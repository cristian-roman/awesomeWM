pcall(require, "luarocks.loader")
require("awful.autofocus")

require("init.async_errors_handler")
require("init.layouts")

require("init.theme")

require("keybindings")
require("mousebindings.tags_bindings")

require("init.monitors_setup")

require("init.rules")
require("init.signals")